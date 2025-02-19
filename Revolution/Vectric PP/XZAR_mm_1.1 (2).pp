+================================================
+                                                
+ Grbl - Vectric machine output configuration file   
+                                                
+================================================
+                                                
+ History                                        
+                                                  
+ Who      When       What                         
+ ======== ========== ===========================
+ EdwardP  11/02/2015 Written from Grbl_mm.pp but
+                     set G20
+ EdwardP  11/02/2015 Commented out arcs as these
+                     slow GRBL performance appear 
+                     interpolated anyway.
+ EdwardP  18/06/2015 Explicitly set absolute mode (G90)
+ Mark     24/11/2015 Updated for interim 0.9 spec.
+                     Renaming to be machine specific.
+                     Removing M30 from Footer.
+ Edward   21/05/2020 Consolidated all changes from mm 
+ Edward   02/06/2020 Consolidated all changes from mm 
+ GrzegorzK 13/07/2020 Added X Y missing from the plunge record.
+ BobsCNC   1/1/2021   Modified for Revolution
+================================================

POST_NAME = "XZAR (mm) (*.gcode)"

FILE_EXTENSION = "gcode"

 
UNITS = "MM"

ROTARY_WRAP_Y = "A"


+------------------------------------------------
+    Line terminating characters                 
+------------------------------------------------
 
LINE_ENDING = "[13][10]"
 
+------------------------------------------------
+    Block numbering                             
+------------------------------------------------
 
LINE_NUMBER_START     = 0
LINE_NUMBER_INCREMENT = 10
LINE_NUMBER_MAXIMUM = 999999
 
+================================================
+                                                
+    Formatting for variables                     
+                                                
+================================================
VAR WRAP_DIAMETER = [WRAP_DIA|A||1.4]
VAR LINE_NUMBER = [N|A|N|1.0]
VAR POWER = [P|C|S|1.0|10.0]
VAR SPINDLE_SPEED = [S|A|S|1.0]
VAR FEED_RATE = [F|C|F|1.1]
VAR X_POSITION = [X|C|X|1.4]
VAR Y_POSITION = [Y|C|Y|1.4]
VAR Z_POSITION = [Z|C|Z|1.4]
VAR X_HOME_POSITION = [XH|A|X|1.4]
VAR Y_HOME_POSITION = [YH|A|Y|1.4]
VAR Z_HOME_POSITION = [ZH|A|Z|1.4]
 
+================================================
+                                                
+    Block definitions for toolpath output       
+                                                
+================================================
 
+---------------------------------------------------
+  Commands output at the start of the file
+---------------------------------------------------
 
begin HEADER
"T1"
"G21"
"G90"
"G0[XH][YH]"
"G0[ZH]"
 
+---------------------------------------------------
+  Command output after the header to switch spindle on
+---------------------------------------------------
 
begin SPINDLE_ON

"[S]M3"


+---------------------------------------------------
+  Commands output for rapid moves 
+---------------------------------------------------
 
begin RAPID_MOVE
 
"G0[X][Y][Z]"


+---------------------------------------------------
+  Commands output for the plunge move
+---------------------------------------------------

begin PLUNGE_MOVE

"G1[X][Y][Z][F]"

 
+---------------------------------------------------
+  Commands output for the first feed rate move
+---------------------------------------------------
 
begin FIRST_FEED_MOVE
 
"G1[X][Y][Z][P][F]"
 
 
+---------------------------------------------------
+  Commands output for feed rate moves
+---------------------------------------------------
 
begin FEED_MOVE
 
"G1[X][Y][Z][P]"
 
 
+---------------------------------------------------
+  Commands output for the first clockwise arc move
+---------------------------------------------------
 

+---------------------------------------------------
+  Commands output when the jet is turned on
+---------------------------------------------------

begin JET_TOOL_ON

"M4[P]"

+---------------------------------------------------
+  Commands output when the jet is turned off
+---------------------------------------------------

begin JET_TOOL_OFF

"M5"

+---------------------------------------------------
+  Commands output when the jet power is changed
+---------------------------------------------------

begin JET_TOOL_POWER
"[P]"


 
+---------------------------------------------------
+  Commands output at the end of the file
+---------------------------------------------------
 
begin FOOTER

"M5"
"G0[ZH]"
"G0[XH][YH]"
"M2"