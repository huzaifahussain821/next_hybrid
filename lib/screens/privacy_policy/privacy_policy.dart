import 'package:purpose_payment/dialog/delete_dialogbox.dart';
import 'package:purpose_payment/screens/profile_view/profile_view.dart';
import 'package:purpose_payment/utilities/app_exports.dart';
import 'package:purpose_payment/widgets/custom_text.dart';
import 'package:purpose_payment/widgets/primary_button.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget.backAppBar("Privacy Policies"),
      backgroundColor: AppThemes.primaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextWidget(
                text:
                    "Lorem ipsum dolor sit amet consectetur. Sit scelerisque nibh ullamcorper justo nisl tortor habitant egestas cras. Vitae mauris duis faucibus aliquam nascetur. Quam ut id mi ut. Tempus in amet sed volutpat tristique vestibulum elementum. Ipsum viverra vitae egestas facilisis. Tempus sed egestas ullamcorper dictum integer magna sit quam pellentesque. Accumsan nunc risus donec quis purus sed id. Diam sit massa ornare purus nisi quam. Donec scelerisque eu lectus aliquam tellus nisl eget ut. Consequat faucibus sagittis semper felis orci eu.Posuere gravida etiam suspendisse proin auctor netus. Aliquam at at aliquam egestas felis eget. Aliquam eget pretium malesuada lacus in. Arcu scelerisque quis dui accumsan sagittis vel eu non ut. Metus ut quis tincidunt velit arcu. Placerat habitasse pellentesque aliquet morbi in sit et ac. Vulputate sed ullamcorper leo etiam sed habitant pretium.Pulvinar porttitor ult. Lorem Ipau. Rices ac lectus. Ornare rhoncus mauris viverra lectus vivamus at. Elit eu viverra proin pharetra odio vitae nunc a. Consequat adipiscing feugiat interdum purus pulvinar. Massa amet condimentum morbi potenti. Amet id natoque nulla sit convallis elementum nisl. Malesuada diam a tortor eget ut netus ut cursus. Amet faucibus tincidunt rutrum aliquam massa enim condimentum consequat. Interdum a sagittis gravida est. Tortor pellentesque ju.elementum nisl. Malesuada diam a tortor eget ut netus ut cursus. Amet faucibus tincidunt rutrum aliquam massa enim condimentum consequat. Interdum a sagittis gravida est. Lorem Ipau. Rices ac lectus. Ornare rhoncus mauris viverra lectus vivamus at. Elit eu viverra proin pharetra odio vitae nunc a. Consequat adipiscing feugiat interdum purus pulvinar. Massa amet condimentum morbi potenti. Amet id natoque nulla sit convallis elementum nisl. Malesuada diam a tortor eget ut netus ut cursus. ",
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
