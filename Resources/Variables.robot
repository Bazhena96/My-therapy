*** Variables ***
&{CORRECT USERNAME BUT INCORRECT PASSWORD}  UserName=testadmin@gmail.com  UserPassword=123457899  ErrorMessage=id=android:id/message
&{INCORRECT USERNAME BUT CORRECT PASSWORD}  UserName=catcatcat@gmail.com  UserPassword=change13  ErrorMessage=id=android:id/message
&{INCORRECT PASSWORD AND USERNAME}  UserName=catcatcat@gmail.com  UserPassword=123456788  ErrorMessage=id=android:id/message
