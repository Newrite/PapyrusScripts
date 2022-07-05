Scriptname HH_silver_book_script extends ObjectReference  

GlobalVariable Property HH_Glob_Silver_T2 Auto

Event OnRead()
  HH_Glob_Silver_T2.SetValue(1)
endEvent