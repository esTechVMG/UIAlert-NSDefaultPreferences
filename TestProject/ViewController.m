//
//  ViewController.m
//  TestProject
//
//  Created by A4-iMAC01 on 21/10/2020.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults * userDefault = [NSUserDefaults standardUserDefaults];
    NSString * message = [userDefault objectForKey:@"msj"];
    if(![message isEqualToString:@""]){
        _label.text=message;
    }
    // Do any additional setup after loading the view.
}

- (IBAction)btnPressed:(id)sender {
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Atencion" message:@"Se ha lanzado una alerta" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction * defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        [self otherAlert];
    }];
    UIAlertAction * secondAction = [UIAlertAction actionWithTitle:@"Segundo" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action){}];
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action){}];
    [alert addAction:defaultAction];
    [alert addAction:secondAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}
-(void)otherAlert{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Atencion" message:@"Se ha lanzado una alerta" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * otherAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action){
        self.label.text = @"Ha dicho OK";
        [self saveOnUserDefault:self.label.text];
    }];
    [alert addAction:otherAction];
    [self presentViewController:alert animated:YES completion:nil];
}
-(void)saveOnUserDefault:(NSString *)message{
    NSUserDefaults* userDefaults= [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:message forKey:@"msj"];
}
@end
