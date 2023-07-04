import 'package:flutter/material.dart';
import 'package:fluttersnips/models/card_model.dart';
import 'layout_wild_list.dart';


const List<CardModel> layoutListW = [
  CardModel(
      'someshpandey25072002@gmail.com',
      '''
      // package:font_awesome_flutter/font_awesome_flutter.dart
      // Run this to get dependencies : flutter pub add font_awesome_flutter
     const bottomContainerHeight = 80.0;
const inactiveCardColor = Color(0xFF111330);
const activeCardColor = Color(0xFFEB1555);
//const activeCardColor = Color(0xFF1D1E33);



class LayoutOne extends StatefulWidget {
  const LayoutOne({Key? key}) : super(key: key);

  @override
  State<LayoutOne> createState() => _LayoutOneState();
}

class _LayoutOneState extends State<LayoutOne> {

  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

  void updateColor(int gender){
    //male = 1
    if(gender==1){
      if(maleCardColor==inactiveCardColor){
        maleCardColor=activeCardColor;
        femaleCardColor=inactiveCardColor;
      }
      else{
        maleCardColor=inactiveCardColor;
      }
    }
    //female 2
    if(gender==2){
      if(femaleCardColor==inactiveCardColor){
        femaleCardColor=activeCardColor;
        maleCardColor=inactiveCardColor;
      }
      else{
        femaleCardColor=inactiveCardColor;
      }
    }
  }

  int height=180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        backgroundColor: Color(0xFF111320),
        appBar: AppBar(
          backgroundColor: Color(0xFF1D1E33),
          title: Text(
            'Layout 1',
          ),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          updateColor(1);
                        });
                      },
                      child: ReusableCard(
                        //colour: Color(0xFF1D1E33),
                        colour: maleCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.mars,
                              size: 80,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'MALE',
                              style: TextStyle(
                                fontSize: 18,
                                color:  Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          updateColor(2);
                        });
                      },
                      child: ReusableCard(
                        //colour: Color(0xFF1D1E33),
                        colour: femaleCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.venus,
                              size: 80,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'FEMALE',
                              style: TextStyle(
                                fontSize: 18,
                                color:  Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: Color(0xFF1D1E33),
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                          ),
                        ),
                        Text(
                          'cm',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: 100.0,
                      max: 300.0,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: Color(0xFF1D1E33),
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                weight.toString(),
                                style: TextStyle(
                                  fontSize: 50,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'KG',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FloatingActionButton(
                                backgroundColor: Color(0xFF4C4F5E),
                                onPressed: (){
                                  setState(() {
                                    weight=weight-1;
                                  });
                                },
                                child: Icon(
                                  Icons.minimize,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 10,),
                              FloatingActionButton(
                                backgroundColor: Color(0xFF4C4F5E),
                                onPressed: (){
                                  setState(() {
                                    weight=weight+1;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: Color(0xFF1D1E33),
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                age.toString(),
                                style: TextStyle(
                                  fontSize: 50,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Years',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FloatingActionButton(
                                backgroundColor: Color(0xFF4C4F5E),
                                onPressed: (){
                                  setState(() {
                                    age=age-1;
                                  });
                                },
                                child: Icon(
                                  Icons.minimize,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 10,),
                              FloatingActionButton(
                                backgroundColor: Color(0xFF4C4F5E),
                                onPressed: (){
                                  setState(() {
                                    age=age+1;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                // Calculate Button
              },
              child: Container(
                color: Color(0xFFEB1555),
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: bottomContainerHeight,
                child: Center(
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {

  ReusableCard({required this.colour,required this.cardChild });

  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colour  ,
      ),
    );
  }
}


''',
      'Layout 1',
      LayoutOne(),
      'Layout 1',),
  CardModel(
    'someshpandey25072002@gmail.com',
      '''
      // download images folder for GitHub 
      // add this folder in assets in pubspec.yaml file
      class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/background.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        left: 30,
                        width: 80,
                        height: 200,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/light-1.png'),
                            ),
                          ),
                        )
                    ),
                    Positioned(
                      left: 140,
                      width: 80,
                      height: 150,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/light-2.png'),
                          ),
                        ),
                      )
                      ,),
                    Positioned(
                      right: 40,
                      top: 40,
                      width: 80,
                      height: 150,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/clock.png'),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, 1),
                            blurRadius: 20.0,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.grey)),
                            ),
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email Address",
                                hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.grey)),
                            ),
                            child: TextField(
                              obscureText: true,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                        ],
                      ),
                    ),
                    SizedBox(height: 50,),
                    Container(
                      width: double.infinity,
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        onPressed: () {

                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(143, 148, 251, 2),
                            ),
                            elevation: MaterialStatePropertyAll(15),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                              ) ,
                            )
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 70,),
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Color.fromRGBO(143,148, 251, 1),

                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'Register',
                      style: TextStyle(
                        color: Color.fromRGBO(143,148, 251, 1),

                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
''',
      'Layout 2',
      LoginPage(),
      'Login Page',),
];