import Foundation

public class DU21SmartOTP {
    
    private var mTimer: Timer? = nil
    private var mGenerateTime = 0
    private var mInput = ""
    private var mCounter = 0
    private var mCurrentOTP = ""
    private var mCurrentTimeLeft = 0
    
    private var period = 30000
    private var digit = 6
    private var maxGenerateTime = 2
    
    public init(period: Int = 30000,
                digit: Int = 6,
                maxGenerateTime: Int = 2) {
        self.period = period
        self.digit = digit
        self.maxGenerateTime = maxGenerateTime
    }
    public var listenerOTP: ((_ otpValue: String, _ secondLeft: Int) -> Void)? = nil
    public var listenerOTPExpired: (() -> Void)? = nil
    
    public func clear() {
        mCurrentOTP = ""
        mCurrentTimeLeft = 0
        mCounter = 0
        mInput = ""
        mTimer?.invalidate()
    }
    
    public func createShareKey(input: String) -> String {
        return input.sha256()
    }
    
    public func createTOTP(input: String) {
        mGenerateTime = 0
        mInput = input
//        getTOTP()
    }
    
    private func getTOTP() {
        let shareKey = createShareKey(input: mInput)
        TimeUtil().getTime { [self] (ntpTime) in
            let counter = ntpTime / period
            let totp = TOTP(secret: shareKey.dataUsingUTF8StringEncoding, digits: digit, timeInterval: counter, algorithm: .sha256)
            mCurrentOTP = totp?.generate(secondsPast1970: ntpTime) ?? "000000"
            
            //Calculate time left
            let timePeriodLimit = counter + 1
            let timePeriodLimitMilisecond = timePeriodLimit * period
            mCurrentTimeLeft = timePeriodLimitMilisecond - ntpTime
            
            mGenerateTime = mGenerateTime + 1
            countDownOtp()
        }
    }
    
    private func countDownOtp() {
        mCounter = mCurrentTimeLeft / 1000
        mTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
    }
    
    @objc private func countDown() {
        if mCounter > 0 {
            mCounter = mCounter - 1
            DispatchQueue.main.sync {
                listenerOTP?(mCurrentOTP, mCounter)
            }
        } else {
            if mGenerateTime < maxGenerateTime {
                getTOTP()
            } else {
                DispatchQueue.main.sync {
                    listenerOTPExpired?()
                }
            }
        }
    }
    
}
