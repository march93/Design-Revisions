//
//  LoginController.m
//  SFUMobileApp
//
//  Created by Ricardo Haro Colmenero
//             Emre Erhan
//                          on 2015-03-08.
//  Copyright (c) 2015 Ricardo Haro Colmenero. All rights reserved.
// This File follows Derma Solutions coding and commenting standards as specified in the Quality Assurance document and the ReadMe file attached to this project's folder
#import "LoginController.h"
#import "TFHpple.h"
#import "AppDelegate.h"

NSString *tableWithCSS;
NSString *listWithCSS;
boolean_t Ready2 = NO;


@interface LoginController ()

@end

@implementation LoginController

-(IBAction)textField:(id)sender
{
    [sender resignFirstResponder];
}

-(IBAction)password:(id)sender
{
    [sender resignFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   [self.logIn setTitle:@"Login" forState:UIControlStateNormal];
    
    //load a hidden webview with go.sfu.ca
    [self.loginWebview loadRequest: [NSURLRequest requestWithURL: [NSURL URLWithString:@"https://go.sfu.ca/"]]];
    
    self.loginWebview.delegate = self;

//if there is already information stored, skip the login option
    /*if (listWithCSS != nil) {
        [self performSegueWithIdentifier:@"ShowSchedule" sender:self];
    }*/
    
    [self portraitUnLock];
}

- (void) viewWillAppear:(BOOL)animated{
    
}
// Allow rotation
-(void) portraitUnLock {
    AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    appDelegate.screenIsPortraitOnly = false;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Injects local javascript to webview
- (void)injectJavascript:(NSString *)resource {
    
    NSString *jsPath = [[NSBundle mainBundle] pathForResource:resource ofType:@"js"];
    NSString *js = [NSString stringWithContentsOfFile:jsPath encoding:NSUTF8StringEncoding error:NULL];
    
    [self.loginWebview stringByEvaluatingJavaScriptFromString:js];
}
//Activates when "login" button is pressed. Uses javascript to insert text from textfields to textboxes on webview and presses the login button.
- (IBAction)buttonAction:(id)sender {
    
    UIAlertView *invalidLoginAlert2 = [[UIAlertView alloc] initWithTitle:@"Login Unsuccesful"
                                                                 message:@"Please provide a username and password"
                                                                delegate:nil
                                                       cancelButtonTitle:@"Try again"
                                                       otherButtonTitles:nil];
    
    NSString *username = self.textField.text;
    NSString *password = self.password.text;
    if (([self.textField.text  isEqual: @""]) || ([self.password.text  isEqual: @""])){
        [invalidLoginAlert2 show];
    }
    NSString *jsCallBack = [NSString stringWithFormat:@"updateWebForm('%@','%@');",username,password];
    [self injectJavascript:@"updateWebForm"];
    [self.loginWebview stringByEvaluatingJavaScriptFromString:jsCallBack];
    
    
    
    
}

//old function,  kept for testing purposes
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.textField resignFirstResponder];
    [self.password resignFirstResponder];
}



- (BOOL)webView:(UIWebView *)webview shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSString *URL = request.URL.absoluteString;
    UIAlertView *invalidLoginAlert = [[UIAlertView alloc] initWithTitle:@"Login Unsuccesful"
                                                    message:@"Invalid username or password"
                                                   delegate:nil
                                          cancelButtonTitle:@"Try again"
                                          otherButtonTitles:nil];
    
    
    //when current URL is changed, check if it's the webpage that results from a successful login
    if ([URL isEqualToString:@"https://go.sfu.ca/psp/paprd/EMPLOYEE/EMPL/h/?tab=SFU_STUDENT_CENTER"]){
        Ready2 = YES;
        
        //Weekly Schedule & List CSS
        NSString *CSSstring = @"<link rel='stylesheet' type='text/css' href=\'SSS_STYLESHEET_2.css\' /><body bgcolor='#54585A'></body>";
        
        //href='https://sims-prd.sfu.ca/cs/csprd/cache/SSS_STYLESHEET_1.css'
        
        //Weekly Schedule URL
        NSURL *myURL = [NSURL URLWithString:@"https://sims-prd.sfu.ca/psc/csprd_1/EMPLOYEE/HRMS/c/SA_LEARNER_SERVICES.SSR_SSENRL_SCHD_W.GBL?Page=SSR_SS_WEEK&Action=A&ExactKeys=Y&EMPLID=301168592&TargetFrameName=None&PortalActualURL=https%3a%2f%2fsims-prd.sfu.ca%2fpsc%2fcsprd_1%2fEMPLOYEE%2fHRMS%2fc%2fSA_LEARNER_SERVICES.SSR_SSENRL_SCHD_W.GBL%3fPage%3dSSR_SS_WEEK%26Action%3dA%26ExactKeys%3dY%26EMPLID%3d301168592%26TargetFrameName%3dNone&PortalRegistryName=EMPLOYEE&PortalServletURI=https%3a%2f%2fgo.sfu.ca%2fpsp%2fpaprd_1%2f&PortalURI=https%3a%2f%2fgo.sfu.ca%2fpsc%2fpaprd_1%2f&PortalHostNode=EMPL&NoCrumbs=yes&PortalKeyStruct=yes"];
        //List Schedule URL
        NSURL *listviewURL = [NSURL URLWithString:@"https://sims-prd.sfu.ca/psc/csprd_1/EMPLOYEE/HRMS/c/SA_LEARNER_SERVICES.SS_ES_STUDY_LIST.GBL?Page=SS_ES_STUDY_LIST&Action=U&ACAD_CAREER=UGRD&INSTITUTION=SFUNV&STRM=1151&TargetFrameName=None"];
        
        
        
        //store the HTML of both URLS on different NSData Objects
        NSData *urlData = [NSData dataWithContentsOfURL:myURL];
        NSData *listviewData = [NSData dataWithContentsOfURL:listviewURL];
        
        //initialize html parser object with the contents of myURL
        TFHpple *htmlParser = [TFHpple hppleWithHTMLData:urlData];
        TFHpple *listviewParser = [TFHpple hppleWithHTMLData:listviewData];
        
       //perform a search using XpathQuery on the source html to extract the list, store in an array of TFHpple Elements, then extract the weekly schedule and store as "tablenode"
        NSString *tableXpathQueryString = @"//table[@id='WEEKLY_SCHED_HTMLAREA']";
        NSArray *htmlNodes = [htmlParser searchWithXPathQuery:tableXpathQueryString];
        TFHppleElement *tableNode = [htmlNodes firstObject];
        
        //perform a search using XpathQuery on the source html to extract the list, store in an array of TFHpple Elements, then extract the list and store as "listnode"
        NSString *listXpathQueryString = @"//table[@id='$ICField76$scroll$0']";
        NSArray *listNodes = [listviewParser searchWithXPathQuery:listXpathQueryString];
        TFHppleElement *listnode = [listNodes firstObject];
        
         //concatenate list html with the proper css
        NSString *listString = listnode.raw;
        listWithCSS = [CSSstring stringByAppendingString:listString];
        
        
        //concatenate table html with the proper css
        NSString *tablestring= tableNode.raw;
        tableWithCSS = [CSSstring stringByAppendingString:tablestring];
        
        //return to the go.sfu.ca homepage without login
        [_loginWebview loadRequest: [NSURLRequest requestWithURL: [NSURL URLWithString:@"https://go.sfu.ca/"]]];
        
        //since login is confirmed, activate button that takes to new view
        [_readyButton sendActionsForControlEvents:UIControlEventTouchUpInside];
        //_loginWebview.hidden=NO;
        return YES;
    }
    else if([URL isEqualToString:@"https://go.sfu.ca/psp/paprd/EMPLOYEE/EMPL/h/?tab=PAPP_GUEST&e1=Your%2520User%2520ID%2520and%2for%2520Password%2520are%2520invalid.&e2=&e3=paprd"]){
        [invalidLoginAlert show];
        [self.loginWebview loadRequest: [NSURLRequest requestWithURL: [NSURL URLWithString:@"https://go.sfu.ca/"]]];
        return YES;
    }
   
    
    return YES;
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"ShowSchedule"]) {
        //pushes the list and table data to another viewcontroller
        CourseViewer *secondlogincontroller = [segue destinationViewController];
        secondlogincontroller.listView = listWithCSS;
        secondlogincontroller.weeklySchedule = tableWithCSS;
    }
}

@end
