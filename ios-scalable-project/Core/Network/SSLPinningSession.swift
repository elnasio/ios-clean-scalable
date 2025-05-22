//
//  SSLPinningSession.swift
//  ios-scalable-project
//
//  Created by Mories Hutapea on 22/05/25.
//

import Foundation
import Security

final class SSLPinningSession: NSObject {
    private let isPinningEnabled: Bool

    init(isPinningEnabled: Bool = true) {
        self.isPinningEnabled = isPinningEnabled
    }

    private lazy var session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config, delegate: self, delegateQueue: nil)
    }()

    func performRequest(_ request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        let task = session.dataTask(with: request) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            completion(.success(data ?? Data()))
        }

        task.resume()
    }
}

extension SSLPinningSession: URLSessionDelegate {
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge,
                    completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {

        guard isPinningEnabled else {
            completionHandler(.performDefaultHandling, nil)
            return
        }

        guard
            let serverTrust = challenge.protectionSpace.serverTrust,
            let certificateChain = SecTrustCopyCertificateChain(serverTrust) as? [SecCertificate],
            let serverCertificate = certificateChain.first,
            let localCertPath = Bundle.main.path(forResource: "your_cert", ofType: "cer"),
            let localCertData = try? Data(contentsOf: URL(fileURLWithPath: localCertPath))
        else {
            completionHandler(.cancelAuthenticationChallenge, nil)
            return
        }

        let serverCertData = SecCertificateCopyData(serverCertificate) as Data

        if serverCertData == localCertData {
            let credential = URLCredential(trust: serverTrust)
            completionHandler(.useCredential, credential)
        } else {
            completionHandler(.cancelAuthenticationChallenge, nil)
        }
    }
}
