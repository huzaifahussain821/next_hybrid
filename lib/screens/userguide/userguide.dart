import 'package:purpose_payment/dialog/delete_dialogbox.dart';
import 'package:purpose_payment/screens/profile_view/profile_view.dart';
import 'package:purpose_payment/utilities/app_exports.dart';
import 'package:purpose_payment/widgets/custom_text.dart';
import 'package:purpose_payment/widgets/primary_button.dart';

class UserguideView extends StatelessWidget {
  const UserguideView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget.backAppBar("User Guide"),
      backgroundColor: AppThemes.primaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
                text: "Lorem ipsum dolor sittesque alietiam ",
                textColor: Colors.black,
                fontWeight: FontWeight.bold,
                maxLine: 100,
                textSize: 1.1,
              ),
              10.verticalSpace,
              CustomTextWidget(
                text:
                    "Lorem ipsum dolor sittesque alietiam sed habitant pretium.Pulvinar porttitor ult. Lorem Ipau. Rices ac lectus. Ornare rhoncus mauris viverra lectus vivamus at. Elit eu viverra proin pharetra odio vitae nunc a. Consequat adipiscing feugiat interdum purus pulvinar. Massa amet condimentum morbi potenti. Amet id natoque nulla sit convallis elementum nisl. Malesuada diam a tortor eget ut netus ut cursus. Amet faucibus tincidunt rutrum aliquam massa enim condimentum consequat. Interdum a sagittis gravida est. Tortor pellentesque ju.elementum nisl. Malesuada diam a tortor eget ut netus ut cursus. Amet faucibus tincidunt rutrum aliquam massa enim condimentum consequat. Interdum a sagittis gravida est. Lorem Ipau. Rices ac lectus. Ornare rhoncus mauris viverra lectus vivamus at. Elit eu viverra proin pharetra odio vitae nunc a. Consequat adipiscing feugiat interdum purus pulvinar. Massa amet condimentum morbi potenti. Amet id natoque nulla sit convallis elementum nisl. Malesuada diam a tortor eget ut netus ut cursus. ",
                textColor: Colors.grey,
                maxLine: 100,
              ),
              20.verticalSpace,
              CustomTextWidget(
                text: "Lorem ipsum dolor sittesque alietiam ",
                textColor: Colors.black,
                fontWeight: FontWeight.bold,
                maxLine: 100,
                textSize: 1.1,
              ),
              10.verticalSpace,
              CustomTextWidget(
                text:
                    "Lorem ipsum dolor sittesque alietiam sed habitant pretium.Pulvinar porttitor ult. Lorem Ipau. Rices ac lectus. Ornare rhoncus mauris viverra lectus vivamus at. Elit eu viverra proin pharetra odio vitae nunc a. Consequat adipiscing feugiat interdum purus pulvinar. Massa amet condimentum morbi potenti. Amet id natoque nulla sit convallis elementum nisl. Malesuada diam a tortor eget ut netus ut cursus. Amet faucibus tincidunt rutrum aliquam massa enim condimentum consequat. Interdum a sagittis gravida est. Tortor pellentesque ju.elementum nisl. Malesuada diam a tortor eget ut netus ut cursus. Amet faucibus tincidunt rutrum aliquam massa enim condimentum consequat. Interdum a sagittis gravida est. Lorem Ipau. Rices ac lectus. Ornare rhoncus mauris viverra lectus vivamus at. Elit eu viverra proin pharetra odio vitae nunc a. Consequat adipiscing feugiat interdum purus pulvinar. Massa amet condimentum morbi potenti. Amet id natoque nulla sit convallis elementum nisl. Malesuada diam a tortor eget ut netus ut cursus. ",
                textColor: Colors.grey,
                maxLine: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
