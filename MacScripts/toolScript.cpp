/*File Name: toolScript.cpp
*
*This file edits system stuff depending on user input
*
*Author: Mj Burog
*/

#include <stdio.h> //standard library input/output etc
#include <stdlib.h> //same thing as cstdlib
#include <fcntl.h> //file control library
#include <sys/stat.h> //library for getting file attributes
#include <iostream> //stream and input/output library
#include <unistd.h> //for misc symbols and constant types like null
#include <string.h> //basic strings
#include <thread> //class to represent individual threads of execution
#include <chrono> //date and time library
#include <cstdlib> //random numbers, general stuff
#include <ctime> //c-style time utilities
using namespace std; //Getline namespace

//-------------------------------------
//Function Vars
char appName[256]; //Name of app the user enters
char appName2[256]; //Name of app with 2 words
char appName3[256]; //Name of App with 3 words
char input[256]; //user input choice in initialization
char realName[256]; //real name of newly added user
char options[256]; //user input choice in user account alteration
char username[256]; //username entry for user password alteration
char adminAlt[256]; //username entry for admin alteration
char newUser[256]; //username for newly added user
char optionsAlt[256]; //variable for either adding admin or removing admin
char delUser[256]; //username for user being delete
char usrDelFunc[256]; //variable for conditional user deleting
char rebootAdmin[256]; //reboot variable for admin assignment
char retDis[256]; //return variable for display function
char altMenu[256]; //menu for admin alter
char name[256]; //name of app to uninstal;
char userPassword[256]; //Variable string for new user password
char uninst[256]; //variable name for application user wants to uninstall
int uniqueID = 1000; //establishes unique ID of new users
int multName = 0; //Determines amount of words in appName call
int numID = rand() % 9000 + 1000; //random num generator for uniqueID generation
char endLineChar; //getline char
//-------------------------------------
//Functions
//-------------------------------------
//Function Declaration
void initializationApp();
void initializationTools();
void uninstall();
void usrDelete();
void intConnect();
void devTools();
void sniffer();
void install();
void openCap();
int main();
//-------------------------------------
//Progress Bar (really just looks cool)
void progressbar(){
    std::srand(time(NULL));
    for(int progress=0;progress!=100;progress+=std::rand()%50){
        if(progress>100) progress=100;
        std::cout<<"[";
        for(int i=0;i<100;i++)
            if(i<progress)
                std::cout<<'=';
            else if(i==progress)
                std::cout<<'>';
            else
                std::cout<<' ';
                std::cout<<"]"<<progress<<" %"<<'\r';
                std::cout.flush();
                std::this_thread::sleep_for(std::chrono::milliseconds(500));
            if(progress==100) break;

    }
    std::cout<<std::endl;
}
//-------------------------------------
//Application Open Function
void appOpen(){
    printf("---------------------------------------------\n");
    system("ls /Applications");
    printf("---------------------------------------------");
    printf("\n");
    printf("Does the app have 1, 2, or 3 words in the file name?\n");
    printf("Or Open New Terminal (4)\n");
    printf("---------------------------------------------\n");
    printf(":");
    scanf("%i", &multName);

    //If app has one words
    if(multName == 1){
        printf("Type Application Name (Case Sensitive)\n");
        printf(":");
        scanf("%c", &endLineChar);
        cin.getline(appName, 256);
        std::string open("-a ");
        std::string application("\\");
        system(("open "+open +appName +application).c_str());
        sleep(1);
        printf("Returning to Menu...\n");
        sleep(1);
        system("clear");
        main();
    }
    //If app has two words
    if(multName == 2){
        printf("Type Application Name (First Word/Case Sensitive)\n");
        printf(":");
        scanf("%c", &endLineChar);
        cin.getline(appName, 256);
        printf("Type Application Name (Second Word/Case Sensitive)\n");
        printf(":");
        cin.getline(appName2, 256);
        std::string open("-a ");
        std::string application("\\ ");
        std::string applicationpt2("\\.app ");
        system(("open "+open +appName +application +appName2 +applicationpt2).c_str());
        sleep(1);
        printf("Returning to Menu...\n");
        sleep(1);
        system("clear");
        main();
    }
    //If app has three words
    if(multName == 3){
        printf("Type Application Name (First Word/Case Sensitive)\n");
        printf(":");
        scanf("%c", &endLineChar);
        cin.getline(appName, 256);
        printf("Type Application Name (Second Word/Case Sensitive)\n");
        printf(":");
        cin.getline(appName2, 256);
        printf("Type Application Name (Third Word/Case Sensitive)\n");
        printf(":");
        cin.getline(appName3, 256);
        std::string open("-a ");
        std::string application("\\ ");
        std::string applicationpt2("\\ ");
        std::string applicationpt3("\\.app");
        system(("open "+open +appName +application +appName2 +applicationpt2 +appName3 +applicationpt3).c_str());
        sleep(1);
        printf("Returning to Menu...\n");
        sleep(1);
        system("clear");
        main();
    }
    if(multName == 4){
        system("open -a terminal -n");
        system("clear");
        main();
    }
    else{
        printf("Input Error...\n");
        sleep(1);
        printf("Returning to App Menu...\n");
        sleep(1);
        system("clear");
        appOpen();
    }
}
//-------------------------------------
//Uninstall Applications
void uninstall(){
    //User input for app uninstall
    printf("Currently Installed Applications\n");
    printf("-----------------------------------------------\n");
    system("ls /Applications");
    printf("-----------------------------------------------\n");
    printf("Uninstall System (a)\n");
    printf("Return to Menu (b)\n");
    printf("--------------------------\n");
    printf(":");
    scanf("%s", uninst);

    if(!strcmp(uninst, "a") || !strcmp(uninst, "A")){
        printf("---------------------------------------------\n");
        printf("Does the app have 1, 2, or 3 words in the file name?\n");
        printf("---------------------------------------------\n");
        printf(":");
        scanf("%i", &multName);
        //If app has one words
        if(multName == 1){
            printf("Type Application Name (Case Sensitive)\n");
            printf(":");
            scanf("%c", &endLineChar);
            cin.getline(appName, 256);
            std::string un("file:///Applications/");
            system(("sudo uninstall "+un +appName).c_str());
            sleep(1);
            printf("Returning to Menu...\n");
            sleep(1);
            system("clear");
            main();
    }
        //If app has two words
        if(multName == 2){
            printf("Type Application Name (First Word/Case Sensitive)\n");
            printf(":");
            scanf("%c", &endLineChar);
            cin.getline(appName, 256);
            printf("Type Application Name (Second Word/Case Sensitive)\n");
            printf(":");
            cin.getline(appName2, 256);
            std::string un("file:///Applications/");
            std::string application("\\ ");
            system(("sudo uninstall " +un +appName +application +appName2).c_str());
            sleep(1);
            printf("Returning to Menu...\n");
            sleep(1);
            system("clear");
            main();
    }
        //If app has three words
        if(multName == 3){
            printf("Type Application Name (First Word/Case Sensitive)\n");
            printf(":");
            scanf("%c", &endLineChar);
            cin.getline(appName, 256);
            printf("Type Application Name (Second Word/Case Sensitive)\n");
            printf(":");
            cin.getline(appName2, 256);
            printf("Type Application Name (Third Word/Case Sensitive)\n");
            printf(":");
            cin.getline(appName3, 256);
            std::string un("file:///Applications/");
            std::string application("\\ ");
            std::string applicationpt2("\\ ");
            std::string applicationpt3("\\.app");
            system(("sudo uninstall " +un +appName +application +appName2 +applicationpt2 +appName3 +applicationpt3).c_str());
            sleep(1);
            printf("Returning to Menu...\n");
            sleep(1);
            system("clear");
            main();
    }
    }
        if(!strcmp(uninst, "b") || !strcmp(uninst, "B")){
            initializationApp();
    }
        else{
            printf("Input Error...\n");
            sleep(1);
            printf("Returning to Menu...\n");
            sleep(1);
            system("clear");
            initializationApp();
    }
}
//-------------------------------------
//Change User Accounts
void userAccts(){
    printf("-------------------------\n");
    printf("Add User (a)\n");
    printf("Delete User (b)\n");
    printf("Change User Password (c)\n");
    printf("Display Current Users (d)\n");
    printf("Admin Right Configuration (e)\n");
    printf("Return to Menu (f)\n");
    printf("-------------------------\n");
    printf(":");
    scanf("%s", options);

//Add User
if(!strcmp(options, "a") || !strcmp(options, "A")){
    //Adding the User
    printf("Type in New User's User Name\n");
    printf(":");
    scanf("%c", &endLineChar);
    cin.getline(newUser, 256);

    //Creating User
    std::string userNewUser("-create /Users/ ");
    system(("sudo dscl . " +userNewUser +newUser).c_str());
    
    //Mounting User to Bin
    std::string userBinpt1("-create /Users/");
    std::string userBinpt2(" UserShell /bin/bash");
    system(("sudo dscl . " +userBinpt1 +newUser +userBinpt2).c_str());
    
    //Adding real name to user
    printf("Type in User's Real Name\n");
    printf(":");
    cin.getline(realName, 256);
    std::string realInputpt1("-create /Users/");
    std::string realInputpt2(" RealName ");
    system(("sudo dscl . " +realInputpt1 +newUser +realInputpt2 +realName).c_str());
    
    //Adding unique ID to User
    printf("Creating Unique ID...\n");
    int numID = rand() % 9000 + 1000;
    uniqueID = numID;
    printf("Unique ID = %d\n", uniqueID);
    std::string sudoIDpt1("-create /Users/"); 
    std::string sudoIDpt2(" UniqueID ");
    std::string sudoIDpt3("" +std::to_string(uniqueID));
    system(("sudo dscl . " +sudoIDpt1 +newUser +sudoIDpt2 +sudoIDpt3).c_str());
    
    //Adding user to primary group ID 1000
    std::string primeGrouppt1("-create /Users/");
    std::string primeGrouppt2(" PrimaryGroupID 1000");
    system(("sudo dscl . " +primeGrouppt1 +newUser +primeGrouppt2).c_str());
    
    //Creating home folder for the new user
    std::string homeDir("-create /Users/");
    std::string homeDirpt2(" NFSHomeDirectory /Users/");
    system(("sudo dscl . " +homeDir +newUser +homeDirpt2 +newUser).c_str());

    //Create home folder without nfs
    std::string home("/Users/");
    system(("sudo mkdir " +home +newUser).c_str());
    std::string desktop("/Desktop/");
    system(("sudo mkdir " +home +newUser +desktop).c_str());
    std::string documents("/Documents/");
    system(("sudo mkdir " +home +newUser +documents).c_str());
    std::string downloads("/Downloads/");
    system(("sudo mkdir " +home +newUser +downloads).c_str());
    std::string library("/Library/");
    system(("sudo mkdir " +home +newUser +library).c_str());
    std::string movies("/Movies/");
    system(("sudo mkdir " +home +newUser +movies).c_str());
    std::string music("/Music/");
    system(("sudo mkdir " +home +newUser +music).c_str());
    std::string pictures("/Pictures/");
    system(("sudo mkdir " +home +newUser +pictures).c_str());
    std::string pub("/Public/");
    system(("sudo mkdir " +home +newUser +pub).c_str());

    //Making User Password
    printf("Type in New User's Password\n");
    printf(":");
    cin.getline(userPassword, 256);
    std::string passSet("-passwd /Users/");
    std::string passSetpt2(" ");
    system(("sudo dscl . " +passSet +newUser +passSetpt2 +userPassword).c_str());
    
    //Returning to main menu
    printf("User Created...\n");
    sleep(1);
    printf("Returning to Menu...\n");
    sleep(1);
    system("clear");
    initializationApp();
}

//Delete User
if(!strcmp(options, "b") || !strcmp(options, "B")){
    //Enable root and delete user
    printf("Enabling Root...\n");
    printf("Enter Name of Root Admin...\n");
    system("dsenableroot");

    //Delete User Function
    usrDelete();
    
    //Conditional Loop to continue or cancel delete
    if(!strcmp(usrDelFunc, "y") || !strcmp(usrDelFunc, "Y")){
        while (true){
            usrDelete();
            if(!strcmp(usrDelFunc, "n") || !strcmp(usrDelFunc, "N")){
                break;
            }
        }
    }

    //Disable Root
    printf("Disabliing root user (Re-enter root admin name)\n");
    system("dsenableroot -d");
    printf("Returning to menu...\n");
    sleep(1);
    system("clear");
    initializationApp();
}

//Change User Password
if(!strcmp(options, "c") || !strcmp(options, "C")){
    printf("Type in Username\n");
    printf(":");
    scanf("%c", &endLineChar);
    cin.getline(username, 256);
    std::string password("passwd ");
    system(("sudo " +password +username).c_str());
    printf("%s\'s password has been changed\n", username);
    sleep(1);
    printf("Returning to Menu...\n");
    sleep(1);
    system("clear");
    initializationApp();
}

//Display Users
if(!strcmp(options, "d") || !strcmp(options, "D")){
    system("dscl . list /Users | grep -v \"^_\"");
    printf("-------------------------\n");
    printf("Return to user alter menu (a)\n");
    printf("End Program (b)\n");
    printf("-------------------------\n");
    printf(":");
    scanf("%s", retDis);

    if(!strcmp(retDis, "a") || !strcmp(retDis, "A")){
        printf("Returning to Menu...\n");
        sleep(1);
        system("clear");
        userAccts();
    }
    if(!strcmp(retDis, "b") || !strcmp(retDis, "B")){
        system("clear");
        exit(0);
    }
    else {
        printf("Input Error...\n");
        sleep(1);
        printf("Returning to Menu...\n");
        sleep(1);
        system("clear");
        initializationApp();
    }
}

//Admin Rights Configuration
if(!strcmp(options, "e") || !strcmp(options, "E")){
    //Edit User Rights
    printf("User Rights Alteration...\n");
    printf("-------------------------\n");
    printf("Give User Admin Privileges (a)\n");
    printf("Remove User Admin Privileges (b)\n");
    printf("View Current Admins (c)\n");
    printf("Return to Menu (d)\n");
    printf("-------------------------\n");
    printf(":");
    scanf("%s", optionsAlt);

    //Yes Admin
    if(!strcmp(optionsAlt, "a") || !strcmp(optionsAlt, "A")){
        //Give admin privileges
        printf("Type in Username\n");
        printf(":");
        scanf("%c", &endLineChar);
        cin.getline(adminAlt, 256);
        std::string alterAddpt1("-append /Groups/admin GroupMembership ");
        std::string alterAdd(" -t user admin");
        system(("sudo dscl . " +alterAddpt1 +adminAlt).c_str());
        printf("%s is now an admin\n", adminAlt);
        
        //reboot after admin removal to confirm admin removal
        printf("Reboot? (y/n)\n");
        printf(":");
        scanf("%s", rebootAdmin);
        if(!strcmp(rebootAdmin, "y") || !strcmp(rebootAdmin, "Y")){
            printf("Rebooting...\n");
            system("sudo reboot");
        }
        if(!strcmp(rebootAdmin, "n") || !strcmp(rebootAdmin, "N")){
            printf("Returning to menu...\n");
            sleep(1);
            system("clear");
            initializationApp();
        }
        else{
        printf("Input Error...\n");
        sleep(1);
        printf("Returning to Menu...\n");
        sleep(1);
        system("clear");
        initializationApp();
        }
    }

    //No Admin
    if(!strcmp(optionsAlt, "b") || !strcmp(optionsAlt, "B")){
        //Take away admin privileges
        printf("Type in Username\n");
        printf(":");
        scanf("%c", &endLineChar);
        cin.getline(adminAlt, 256);
        std::string alterDelpt1("-delete /Groups/admin GroupMembership ");
        std::string alterDel(" -t user admin");
        system(("sudo dscl . " +alterDelpt1 +adminAlt).c_str());
        printf("%s is no longer an admin\n", adminAlt);
        
        //Reboot after admin creation to confirm admin assignment
        printf("Reboot? (y/n)\n");
        printf(":");
        scanf("%s", rebootAdmin);
        if(!strcmp(rebootAdmin, "y") || !strcmp(rebootAdmin, "Y")){
            printf("Rebooting...\n");
            system("sudo reboot");
        }
        if(!strcmp(rebootAdmin, "n") || !strcmp(rebootAdmin, "N")){
            printf("Returning to menu...\n");
            sleep(1);
            system("clear");
            initializationApp();
        }
        else{
        printf("Input Error...\n");
        sleep(1);
        printf("Returning to Menu...\n");
        sleep(1);
        system("clear");
        initializationApp();
        }
    }

    //Show Admins
    if(!strcmp(optionsAlt, "c") || !strcmp(optionsAlt, "C")){
        printf("Current Administrators\n");
        printf("----------------------\n");
        system("dscl . -read /groups/admin GroupMembership");
        printf("----------------------\n");
        printf("Return to User Alter Menu (a)\n");
        printf("End Program (b)\n");
        printf("----------------------\n");
        printf(":");
        scanf("%s", altMenu);

        //Return Functions
        if(!strcmp(altMenu, "a") || !strcmp(altMenu, "A")){
            system("clear");
            userAccts();
        }
        if(!strcmp(altMenu, "b") || !strcmp(altMenu, "B")){
            system("clear");
            exit(0);
        }
    }
    if(!strcmp(optionsAlt, "d") || !strcmp(optionsAlt, "D")){
        system("clear");
        initializationApp();
    }
    else{
        printf("Input Error...\n");
        sleep(1);
        printf("Returning to Menu...\n");
        sleep(1);
        system("clear");
        initializationApp();
    }
}

//Return to Menu
if(!strcmp(options, "f") || !strcmp(options, "F")){
    printf("Returning to menu...\n");
    sleep(1);
    system("clear");
    initializationApp();
}
else {
    printf("Input Error...\n");
    sleep(1);
    printf("Returning to Menu...\n");
    sleep(1);
    system("clear");
    initializationApp();
}
}
//-------------------------------------
//User Delete Function
void usrDelete(){
    //Delete User
    printf("Type in Username to Delete\n");
    printf(":");
    scanf("%c", &endLineChar);
    cin.getline(delUser, 256);
    std::string userDelFunc("delete /Users/");
    system(("sudo dscl . " +userDelFunc +delUser).c_str());

    //Moving user files to backup
    std::string backuppt1("/users/");
    std::string backuppt2(" /Users/Deleted\\ Users");
    system(("sudo mv " +backuppt1 +delUser +backuppt2).c_str());

    //Delete another user
    printf("-------------------------\n");
    printf("Delete Another User? (y/n)\n");
    printf("-------------------------\n");
    printf(":");
    scanf("%s", usrDelFunc);
}
//-------------------------------------
//Internet Connection Test(uses java program)
void intConnect(){
    char intReturn[256];
    
    //Compiles and executes internet.java
    printf("Running Connection Test...\n");
    sleep(1);
    system("java -classpath ~/Desktop/Programs internet.java");

    //Ask to return to menu
    printf("----------------------------------------\n");
    printf("Type Any Letter When Ready to Return to Menu\n");
    printf("----------------------------------------\n");
    printf(":");
    scanf("%s", intReturn);

    if(!strcmp(intReturn, "y") || !strcmp(intReturn, "Y")){
        printf("Returning to Menu...\n");
        sleep(1);
        system("clear");
        main();
    }
    else{
        printf("Returning to Menu...\n");
        sleep(1);
        system("clear");
        main();
    }

}
//-------------------------------------
//Mac Bypass (Creates new Admin)
void macBypass(){
    char yesNo[256];
    char noYes[256];
    printf("Is system in single user mode? (y/n)\n");
    scanf("%s", yesNo);

    if(!strcmp(yesNo, "y") || !strcmp(yesNo, "Y")){
        printf("Creating New Admin Account...\n");
        system("/sbin/ mount -uw /");
        system("rm /var/db/.applesetupdone");
        printf("Reboot? (y/n)");
        scanf("%s", noYes);
        if(!strcmp(noYes, "y") || !strcmp(noYes, "Y")){
            printf("Rebooting...\n");
            system("reboot");
            system("sudo reboot");
        }
        if(!strcmp(noYes, "n") || !strcmp(noYes, "N")){
            printf("Returning to System Editing Menu...\n");
            sleep(1);
            system("clear");
            initializationApp();
        }
        
    }
    if(!strcmp(yesNo, "n") || !strcmp(yesNo, "N")){
        printf("Must be in single user mode...\n");
        sleep(1);
        printf("Returning to Sys Editing...\n");
        sleep(1);
        system("clear");
        initializationApp();
    }
    else {
        printf("Input Error...\n");
        sleep(1);
        printf("Returning to System Editing Menu...\n");
        sleep(1);
        system("clear");
        initializationApp();
    }
}
//-------------------------------------
//Initialization
//Input Segment
void initializationApp(){
    printf("-------------------------");
    printf("File Name: toolScript.cpp");
    printf("-------------------------\n");
    printf(".\n");
    printf("-------------------------\n");
    printf("Open Application (a)\n");
    printf("Change User Accounts (b)\n");
    printf("Internet Connection Test (c)\n");
    printf("MacOS Login Bypass (d)\n");
    printf("Return to Menu (e)\n");
    printf("-------------------------\n");
    printf(":");
    scanf("%s", input); 

    //Conditional Statement to Choose Functions
    if(!strcmp(input, "a") || !strcmp(input, "A")){
        system("clear");
        appOpen();
    }
    if(!strcmp(input, "b") || !strcmp(input, "B")){
        system("clear");
        userAccts();
    }
    if(!strcmp(input, "c") || !strcmp(input, "C")){
        system("clear");
        intConnect();
    }
    if(!strcmp(input, "d") || !strcmp(input, "D")){
        system("clear");
        macBypass();
    }
    if(!strcmp(input, "e") || !strcmp(input, "E")){
        system("clear");
        main();
    }
    else {
        printf("Input Error...\n");
        sleep(1);
        printf("Returning to Menu...\n");
        sleep(1);
        system("clear");
        main();
    }
}
//-------------------------------------
//Tools
void initializationTools(){
        //if else to choose tools
        char crack[256];

        printf("-------------------------");
        printf("File Name: toolScript.cpp");
        printf("-------------------------\n");
        printf(".\n");
        printf("(Tools must be installed before they can be used)\n");
        printf(".\n");
        printf("---------------------\n");
        printf("Tool Installation (a)\n");
        printf("Developer Tool Installation (b)\n");
        printf("Sniffing (c)\n");
        printf("Open Application with Cap File (d)\n");
        printf("Return to Menu (e)\n");
        printf("---------------------\n");
        printf(":");
        scanf("%s", crack);

        if(!strcmp(crack, "a") || !strcmp(crack, "A")){
            system("clear");
            install();
        }
        if(!strcmp(crack, "b") || !strcmp(crack, "B")){
            system("clear");
            devTools();
        }
        if(!strcmp(crack, "c") || !strcmp(crack, "C")){
            system("clear");
            sniffer();
        }
        if(!strcmp(crack, "d") || !strcmp(crack, "D")){
            system("clear");
            openCap();
        }
        if(!strcmp(crack, "e") || !strcmp(crack, "E")){
            printf("Returning to Menu...\n");
            sleep(1);
            system("clear");
            main(); 
        }
        else{
            printf("Returning to Menu...\n");
            sleep(1);
            system("clear");
            main();
        }
}
//-------------------------------------
//Dev Tool Installation
void devTools(){
    //Homebrew Install
    printf("Installing HomeBrew\n");
    std::string brew("/bin/bash -c \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)\"");
    system(("" +brew).c_str());
    printf("Homebrew Installed\n");

    //C Compiler Install
    printf("C Compiler Install...\n");
    system("gcc");
    printf("C Compiler Installed...\n");

    //C++ Compiler Install
    printf("C++ Compiler Install...\n");
    system("g++");
    printf("C++ Compiler Installed...\n");

    //Python Install
    printf("Python Install...\n");
    system("brew install python3");
    printf("Python Installed...\n");

    //Python pkg Install
    printf("Python pkg Installation...\n");
    system("pip3 install pillow");
    system("pip3 install requests");
    system("pip3 install pylint");
    printf("Python pkg Installed\n");

    //gcc@8 Install
    printf("Installing Recent Version of gcc...\n");
    printf("brew install gcc@8");
    printf("gcc@8 Installed\n");

    //Visual Studio Code Install
    printf("Installing Visual Studio Code\n");
    system("brew cask install visual-studio-code");
    printf("Visual Studio Code Installed\n");

    //Visual Studio Install
    printf("Installing Visual Studio\n");
    system("brew cask install visual-studio");
    printf("Visual Studio Installed\n");

    //Return to menu
    printf("Returning to Menu...\n");
    sleep(1);
    system("clear");
    main();

}
//-------------------------------------
//Tool Installation
void install(){
    //Homebrew install
    printf("Installing HomeBrew\n");
    std::string brew("/bin/bash -c \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)\"");
    system(("" +brew).c_str());
    printf("Homebrew Installed\n");

    //Visual Studio Code Install
    printf("Installing Visual Studio Code\n");
    system("brew cask install visual-studio-code");
    printf("Visual Studio Code Installed\n");

    //WireShark Install
    printf("Installing WireShark\n");
    system("brew cask install wireshark");
    printf("WireShark Installed\n");

    //Aircrack download
    //Prereq installation
    printf("Installing Packages\n");
    system("brew install autoconf");
    system("brew install automake");
    system("brew install libtool");
    system("brew install openssl");
    system("brew install shtool");
    system("brew install pkg-config");
    printf("Packages Installed\n");

    //Aircrack install
    printf("Installing Aircrack-ng\n");
    system("brew install pcre");
    system("git clone https://github.com/aircrack-ng/aircrack-ng");
    system("cd aircrack-ng");
    system("autoreconf -i aircrack-ng");
    system("./Desktop/aircrack-ng/configure --with-experimental");
    system("make");
    system("make install");
    system("sudo ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/local/bin/airport");
    printf("Aircrack-ng Installed\n");

    //Return to menu
    printf("Returning to menu...\n");
    sleep(1);
    system("clear");
    main();
}
//-------------------------------------
//Sniffing
void sniffer(){
    //Shows surrounding networks
    printf("Surrounding Networks...\n");
    system("sudo airport -s");

    //Choose network
    int channel = 0;
    printf("-------------------------------\n");
    printf("Enter Network Channel to Sniff\n");
    printf("-------------------------------\n");
    printf("(Hit Ctrl + C to Exit and Save Capture)\n");
    printf(":");
    scanf("%d", &channel);
    std::string channelSniffer("sniff " +std::to_string(channel));
    system(("sudo airport en1 " +channelSniffer).c_str());

}
//-------------------------------------
//Open Captured Packet File
void openCap(){
    //Lists .cap files
    system("ls /tmp/");

    //Opens Capture File in Wireshark
    char capFile[256];
    printf("--------------------------------------------\n");
    printf("Enter Entire Name of Selected Capture File\n");
    printf("--------------------------------------------\n");
    printf(":");
    cin.getline(capFile, 256);
    std::string wireshark("/tmp/");
    system(("open -a \"WireShark\" " +wireshark +capFile).c_str());

}
//-------------------------------------




//-------------------------------------
//Main Program Block
//-------------------------------------
//Program Initialization
int main(){
    //Selection Variables
    char tools[256];

    //Main Initialization
    system("clear");
    printf("-------------------------");
    printf("File Name: toolScript.cpp");
    printf("-------------------------\n");
    progressbar();
    printf("-----------------------\n");
    printf("System Editing (a)\n");
    printf("Tools (b)\n");
    printf("End Program (c)\n");
    printf("-----------------------\n");
    printf(":");
    scanf("%s", tools);

    //if else to determine which part of sys script is used
    if(!strcmp(tools, "a") || !strcmp(tools, "A")){
        system("clear");
        initializationApp();
    }
    if(!strcmp(tools, "b") || !strcmp(tools, "B")){
        system("clear");
        initializationTools();
    }
    if(!strcmp(tools, "c") || !strcmp(tools, "C")){
        system("clear");
        exit(0);
    }
    else{
        printf("Input Error...\n");
        printf("Returning to Menu...\n");
        sleep(1);
        system("clear");
        main();
    }
    
    return 0;
}
