convert to FORTRAN 95 code


program flex_sensor_example

implicit none

integer :: flex_pin
integer :: flex_adc
real :: flex_v
real :: flex_r
real :: angle

flex_pin = A0
flex_adc = analogRead(flex_pin)
flex_v = flex_adc * VCC / 1023.0
flex_r = R_DIV * (VCC / flex_v - 1.0)

angle = map(flex_r, STRAIGHT_RESISTANCE, BEND_RESISTANCE, 0, 90.0)

print*, "Resistance: ", flex_r, " ohms"
print*, "Bend: ", angle, " degrees"

end program flex_sensor_example
