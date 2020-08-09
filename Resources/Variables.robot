*** Variables ***
${medicationName}  azitromicin
${city}  Minsk
${note}  evening
&{correctUserNameIncorrectPassword}  UserName=testadmin@gmail.com  UserPassword=123457899  ErrorMessage=id=android:id/message
&{correctUserNameIncorrectPassword}  UserName=testadmin@gmail.com  UserPassword=123457899  ErrorMessage=id=android:id/message
&{incorrectUsernameCorrectPassword}  UserName=catcatcat@gmail.com  UserPassword=change13  ErrorMessage=id=android:id/message
&{incorrectPasswordIncorrectUsername}  UserName=catcatcat@gmail.com  UserPassword=123456788  ErrorMessage=id=android:id/message
${name}  Bazhenka
${password}  change13
${email}  bazhenkak@gmail.com