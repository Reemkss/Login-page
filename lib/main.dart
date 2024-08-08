import 'package:flutter/material.dart';
import 'package:flutter_application_2/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, //يزيل الشعار الاحمر الافتراضي بالجوال اللي هو الفلتر
      title: 'Flutter Demo', //اسم التطبيق
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(), //الصفحة الاساسية اول ما يشتغل التطبيق
    );
  }
}

bool isSecured = true; //عرفت البتن حق از سكيور

// انشات الماب عشان اخزن فيها الاوبجيكت الخاصة باليوزر عن طريق الكي والفاليو الكي ايميل والفاليو الاوبجيكت حق اليوزر
Map<String, User> users = {
  //غير الليست الماب تاخذ كي فاليو الكي هو الايميل و الفاليو اللي دخله اليوزر
  "reem@gmail.com": User(email: 'reem@gmail.com', password: '1234'),
  "reema@gmail.com": User(email: 'reema@gmail.com', password: '123'),
};

class HomePage extends StatefulWidget {
  //نوع الكلاس ستست فل لان فيه اشياء تتحدث بالصفحة الرييسية اللي هي الفيلد
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController
      emailController = //اضفت ايميل كونترولر وعرفتها عشات اي ايميل اكتبه بالتكست فيلد اقدر استخدمها داخل الكول له وللباس
      TextEditingController(); //هوبجيكت للتحقق من المدخلات
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //خصايص الصفحة نفسها تسمح لنا نقسم الصفحة لاجزاء مثل الاب بار والبدي

      appBar: AppBar(
        // من الصفحة الجزء العلوي
        title: const Text(
          "Login Page",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 0, 50, 83),
        centerTitle: true, //يوسط العنوان بالشاشة
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
          size: 30,
        ),
        actions: const [
          Icon(
            Icons.search,
            color: Colors.white,
            size: 30,
          ),

          SizedBox(
            width: 18,
          ), //مسافة بين العناصر

          Icon(
            Icons.message,
            color: Colors.white,
            size: 30,
          ),
          //  IconButton(onPressed: (onPressed){}, icon: (Icons.search),),
        ],
      ),
      body: SingleChildScrollView(
        //الجزء السفلي من الصفحة
        //تضيف سكرول للصفحة

        child: Column(
          //طبعا العامود يسمح لي اضيف العناصر بشكل طولي فيه
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: [
            Image.asset(
              //بديت احط اول عنصر اللي هو الاميج طبعا  الاميج والخطوط و الايقون لانها تستدعى من حارج التطبيق فلازم انشئ ملف اسسيست اضيف فيه العناصر
              'assets/login.jpg', //الباث للصوره ولا انسى احدث ملف pubspec.yaml
              width: 350,
              height: 350,
            ),
            Padding(
              //استخدمت ودجت البادنق لانه يسمح لي اضيف مسافة بين العناصر من كل الاتجاهات
              padding: const EdgeInsets.all(
                  20), //مثلا هنا اول فهو يضيف مساعات من كل الجهات لكن السمترك تضيف مسافة من جهتين بشكل اما عرضي او طولي واونلي تسمح لي احدد اماكن المسافات
              child: Column(
                //طبعا العامود يسمح لي اضيف العناصر بشكل طولي فيه
                children: [
                  TextFormField(
                    //  عن طريق هادي الودجتاضيف تكست ياخذ قيم
                    //الانبوت فيلد للايميل

                    controller: emailController,
                    decoration: const InputDecoration(
                      //تسمح لي اتحكم بخصايص التكست فيلد زي اضافة ليبل
                      label: Text(
                          "Please Enter Your Email.."), //ضفت ليبل وعشان اضيف اي تكست لازم استخدم تكست
                      prefixIcon: Icon(
                        //لاضافة ايقونه على اليسار
                        Icons.person,
                      ),
                      border: OutlineInputBorder(
                        //اضيف حدود
                        //حدود لتكست فيلد
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    //الانبوت فيلد للباس
                    controller: passwordController, //عشان يتحقق من المدخلات
                    obscureText: isSecured, //تفعل الامان للباس انه يكون.
                    decoration: InputDecoration(
                      label: const Text("Please Enter Your Password.."),
                      prefixIcon: const Icon(
                        Icons.lock,
                      ), //ايقون جهة اليسار
                      suffixIcon: IconButton(
                        //اضيف ايقونه على اليسار وخليت نوع الايقونه زر  بحيث يمديني اضغط عليها
                        onPressed: () {
                          //تجي مع الزر بحيث اذا ضغطت على الايقونه سويي حدث معين
                          setState(() {
                            //تجي مع الستيت فل بحيث ادا ضغطت على هدا البتن الصفحة بتحدث
                            //عشان يغير حالة الباس من مخفي لظاهر والعكس
                            isSecured =
                                !isSecured; // ادا كان ترو وظغطت على الزر تتحول لفولس والعكس
                          });
                        },
                        icon: Icon(Icons.remove_red_eye),
                      ), //اضيف ايقون عين بجهة اليمين
                      border: const OutlineInputBorder(
                        //حدود لتكست فيلد
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40), // يضيف مسافة بين العناصر
                  InkWell(
                    // لهدفها ادا كتبت بالفيلد كلام بتظهر الاوامر بالتيرمنال هي ودجت تسمح اضيف زر
                    onTap: () {
                      //ادا ضغطت زر اللوق ان بيصير الحدث اللي ابيه جوى الاقواس

                      //للتحقق ومقارنة المدخلات بالمدخلات المخزنة
                      User user = users[
                          //خذيت الفاليو او الكلام اللي دخله اليوزر وخزنته بمتغير اليوزر
                          emailController.text]!; // دايم اليوزر بيكون موجود

                      if (user.email == emailController.text &&
                          user.password == passwordController.text) {
                        //مو انا خزنت القيم بعد ما جبتها من الفيلد الحين اقارنها
                        print(
                            'logged'); //تطبع بالتيرمنال عشان اتاكد انه يشتغل زين
                      } else {
                        print('feild email or pass wrong');
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 0, 50, 83),
                          borderRadius: BorderRadius.circular(
                              15) //تتحكم بحواف العنصر منحنية او مستطيله
                          ),
                      child: const Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center, //تتحكم بمكان العنصر
                        children: [
                          Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.login,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
