import 'package:agora/export.dart';

typedef _ = I18n;

class T {
  static const ok = _(
    en: "Ok",
    zh: "好的",
    vi: "Được rồi",
    km: "យល់ព្រម",
  );

  static const yes = _(
    en: 'Yes',
    zh: '是的',
    vi: 'Đúng',
    km: 'បាត',
  );

  static const home = _(
    en: 'Home',
    zh: '家',
    vi: 'Trang chủ',
    km: 'ផ្ទហ',
  );

  static const hello = _(
    en: 'Hello',
    zh: '你好',
    vi: 'Xin chào',
    km: 'ចមរាបសយរ',
  );

  static const hi = _(
    en: 'Hi',
    zh: '你好',
    vi: 'CHÀO',
    km: 'សួស្តី',
  );

  static const somethingUnexpectedWentWrong = _(
    en: 'Something unexpected went wrong',
    zh: '出乎意料的问题出了问题',
    vi: 'Điều gì đó bất ngờ đã sai',
    km: 'អ្វីដែលមិននឹកស្មានដល់បានដំណើរការខុស',
  );

  static const noInternetConnection = _(
    en: 'no internet connection',
    zh: '没有网络连接',
    vi: 'không có kết nối Internet',
    km: 'គ្មានការភ្ជាប់អ៊ីនធឺណិតទេ',
  );

  static const noContent = _(
    en: 'No content',
    zh: '无内容',
    vi: 'Không có nội dung',
    km: 'គ្មានមាតិកា',
  );

  static const tryAgain = _(
    en: 'Try again',
    zh: '再试一次',
    vi: 'Thử lại',
    km: 'ព្យាយាម​ម្តង​ទៀត',
  );

  static const login = _(
    en: 'Login',
    zh: '登录',
    vi: 'Đăng nhập',
    km: 'ចូល',
  );

  static const loginWithMobilePhoneNumber = _(
    en: 'Login With Mobile Phone Number',
    zh: '使用手机号码登录',
    vi: 'Đăng nhập bằng số điện thoại di động',
    km: 'ចូលជាមួយលេខទូរស័ព្ទដៃ',
  );

  static const unregisteredMobilePhoneNumbers = _(
    en: 'Unregistered mobile phone numbers with be automatically registered',
    zh: '未注册的手机号码自动注册',
    vi: 'Số điện thoại di động chưa đăng ký được đăng ký tự động',
    km: 'លេខទូរស័ព្ទចល័តដែលមិនបានចុះបញ្ជីដែលបានចុះឈ្មោះដោយស្វ័យប្រវត្តិ',
  );

  static const getVerificationCode = _(
    en: 'Get Verification Code',
    zh: '获取验证代码',
    vi: 'Nhận mã xác minh',
    km: 'ទទួលបានលេខកូដផ្ទៀងផ្ទាត់',
  );

  static const passwordLogin = _(
    en: 'Password login',
    zh: '密码登录',
    vi: 'Mật khẩu đăng nhập',
    km: 'ចូលចូល',
  );

  static const iHaveReadAndAgreedToThe = _(
    en: 'I have read and agreed to the',
    zh: '我已经阅读并同意',
    vi: 'Tôi đã đọc và đồng ý với',
    km: 'ខ្ញុំបានអាននិងយល់ព្រមចំពោះឯកសារ',
  );

  static const userAgreement = _(
    en: 'User Agreement',
    zh: '用户协议',
    vi: 'sự thỏa thuận của người dùng',
    km: 'កិច្ចព្រមព្រៀងអ្នកប្រើប្រាស់',
  );

  static const privacyPolicy = _(
    en: 'Privacy Policy',
    zh: '隐私政策',
    vi: 'Chính sách bảo mật',
    km: 'គោលការណ៍​ភាព​ឯកជន',
  );

  static const buyerNotice = _(
    en: 'Buyer Notice',
    zh: '买方通知',
    vi: 'Thông báo người mua',
    km: 'សេចក្តីជូនដំណឹងរបស់អ្នកទិញ',
  );

  static const and = _(
    en: 'and',
    zh: '和',
    vi: 'Và',
    km: 'និង',
  );

  static const search = _(
    en: 'Search',
  );

  static const search1 = _(
    en: 'Search',
    zh: '搜索',
    vi: 'Tìm kiếm',
    km: 'ការឆេកឆេ',
  );

  static const filter = _(
    en: 'Filter',
    zh: '筛选',
    vi: 'Lọc',
    km: 'តរមង',
  );

  static const phoneNumber = _(
    en: 'Phone Number',
    zh: '电话号码',
    vi: 'Số điện thoại',
    km: 'លេខទូរសព្ទ',
  );

  static const loginWithPassword = _(
    en: 'Login With Password',
    zh: '使用密码登录',
    vi: 'Đăng nhập bằng mật khẩu',
    km: 'ចូលដោយប្រើពាក្យសម្ងាត់',
  );

  static const otpLogin = _(
    en: 'Otp Login',
    zh: 'OTP登录',
    vi: 'Đăng nhập OTP',
    km: 'otp ចូល',
  );

  static I18n t(String text) {
    if (_map.containsKey(text)) {
      return _map[text]!;
    } else {
      return I18n(en: text);

    }
  }

  static String r(String text) {
    if (_map.containsKey(text)) {
      return _map[text]!.r;
    } else {
      return text;
    }
  }

  static const Map<String, I18n> _map = {
    'CNY': _(en: 'Yuan', zh: '人民币', vi: 'Nhân dân tệ', km: 'យ័ន'),
    'PHP': _(en: 'Peso', zh: '比索', vi: 'Peso', km: 'ភេស៉ូ'),
    'VND': _(en: 'Dong', zh: '盾', vi: 'Đồng', km: 'ដុង'),
    'THB': _(en: 'Baht', zh: '铢', vi: 'Baht', km: 'បាត'),
    'IDR': _(en: 'Rupiah', zh: '卢比', vi: 'Rupiah', km: 'រូពី'),
    'KHR': _(en: 'Riel', zh: '瑞尔', vi: 'Riel', km: 'រៀល'),
    'USD': _(en: 'Dollar', zh: '美元', vi: 'Đô la', km: 'ដុល្លារ'),
    'MYR': _(en: 'Ringgit', zh: '令吉', vi: 'Ringgit', km: 'រីងហ្គីត'),
    'HKD': _(en: 'Dollar', zh: '港元', vi: 'Đô la', km: 'ដុល្លារ'),
    'INR': _(en: 'Rupee', zh: '卢比', vi: 'Rupee', km: 'រូបី')
  };
}
