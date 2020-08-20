*** Variables ***
&{Correct username but incorrect password}  UserName=testadmin@gmail.com  UserPassword=123457899  ErrorMessage=id=android:id/message
&{Correct username but incorrect password}  UserName=testadmin@gmail.com  UserPassword=123457899  ErrorMessage=id=android:id/message
&{Incorrect username but correct password}  UserName=catcatcat@gmail.com  UserPassword=change13  ErrorMessage=id=android:id/message
&{Incorrect password and incorrect username}  UserName=catcatcat@gmail.com  UserPassword=123456788  ErrorMessage=id=android:id/message
