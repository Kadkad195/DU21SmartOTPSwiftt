import Foundation

public class DU21SmartOTP {
    
    private var mTimer: Timer? = nil
    private var mGenerateTime = 0
    private var mInput = ""
    
    public init(period: Int = 30000,
                digit: Int = 6,
                maxGenerateTime: Int = 2) {
        
    }
    var listenerOTP: ((_ otpValue: String, _ secondLeft: Int) -> Void)? = nil
    var listenerOTPExpired: (() -> Void)? = nil
    
    func clear() {
        mInput = ""
        mTimer?.invalidate()
    }
    
    func createShareKey(input: String) -> String {
        return input.sha256()
    }
    
    func createTOTP(input: String) {
        mGenerateTime = 0
        mInput = input
//        getTOTP()
    }
    
}
