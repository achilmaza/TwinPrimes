//
//  ViewController.m
//  TwinPrimes
//
//  Created by Angie Chilmaza on 10/30/15.
//  Copyright © 2015 Angie Chilmaza. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UITextField *numberField;
@property (strong, nonatomic) IBOutlet UITextView *primeOutput;
@property (strong, nonatomic) NSMutableArray * primeList;

- (IBAction)getTwinPrimes:(id)sender;

-(BOOL)isPrime:(int)number;
-(BOOL)checkPrimeList:(int)number;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.primeList = [[NSMutableArray alloc]init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getTwinPrimes:(id)sender {
    
    
    int n = [self.numberField.text intValue];
    int primeCounter=0;
    bool firstPrime  = false;
    bool secondPrime = false;
    NSMutableString * answer = [[NSMutableString alloc]init];
    
    //First N twin primes sets
    
    //reset prime list
    [self.primeList removeAllObjects];
    
    for(int i=3; primeCounter < n; i+=2){
        
        if(secondPrime || [self isPrime:i]){
          [self.primeList addObject:[NSNumber numberWithInt:i]];
          firstPrime = true;
        }
        else{
          firstPrime = false;
        }
        
        if([self isPrime:(i+2)]){
            secondPrime = true;
        }
        else{
            secondPrime = false;
        }
        
        if(firstPrime && secondPrime){
            
            [answer appendFormat:@"twinPrimes(%i, %i) \n", i, i+2];
            fprintf(stderr, "twinPrimes(%i, %i) \n", i, i+2);
            primeCounter++;
        }
        

    }

    self.primeOutput.text = answer;
}

-(BOOL)isPrime:(int)number{

        
    bool prime = true;
    
    if(number == 1){  //1 is not a prime
        return false;
    }
    
    if(number == 2){ //smallest prime
        return true;
    }
    
    if(number %2 == 0){ //check for even numbers
        prime = false;
    }
    else if([self checkPrimeList:number] == false){
        
        prime = false;
    }
    
//    else{
//        
//        double squaredRoot = ceil(sqrt((double)number));
//        int roundedSquaredRoot = (int)squaredRoot;
//        
//        for(int i=3; i<= roundedSquaredRoot; i++){
//            
//            if(number % i == 0 && i!=number){
//                prime = false;
//                break;
//            }
//        }
//    }
    
    return prime;
    
}
            
-(BOOL)checkPrimeList:(int)number{
    
    NSUInteger count = [self.primeList count];
    bool prime = true;
    
    for(int i=0; i<count;i++){
        
        if(number % [self.primeList[i] intValue] == 0 && number != [self.primeList[i] intValue]){
            prime = false;
            break;
        }
    }
    
    return prime;
}


@end
