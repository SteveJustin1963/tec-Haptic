\\ fortgh 83 , need to convert to MINT

: flex-sensor-example

flex-pin @ A0
flex-adc @ flex-pin @ analogRead
flex-v @ flex-adc @ 1023.0 / VCC *
flex-r @ flex-v @ VCC / flex-r @ 1.0 - R_DIV *

angle @ flex-r @ STRAIGHT_RESISTANCE - BEND_RESISTANCE / 90.0 *

." Resistance: " flex-r @ .r .s
." Bend: " angle @ .r .s

;
