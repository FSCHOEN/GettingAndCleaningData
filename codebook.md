# CodeBook

## Human Activity Recognition Using Smartphones 
### tidy data set for R

## General information
 * Number of volunteers: 30
 * Ages: 19-48
 * Used Device: Samsung Galaxy SII (worn on the waist)
 * Measurements: 3-axial linear acceleration and 3-axial angular velocity at 50 Hz
 * Normalization: [-1 , 1]
 * Estimations: mean value and standard deviation
 * Agglomeration: each volunteer and each activity

## Data description
 * `Subject`:  number of volunteer (range: 1-30)
 * `Activity`: type of movement during measurement (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

Measurement names contain 5-7 parts.
 * first part: prefix
  * `t`: linear acceleration and angular velocity in time context
  * `f`: Fast Fourier Transform (FFT) was applied
 
 * second part: force distinction
  * `Body`
  * `Gravity`
 
 * third part: measurement type
  * `Acc`: acceleration [g]
  * `Gyro`: angular velocity [rad/seconds]
 
 * fourth part: jerk signal (optional)
  * `Jerk`: jerk signal
 
 * fifth part: magnitude (optional)
  * `Mag`: magnitude (euclidean norm)
  
 * sixth part: estimated variable from signal
  * mean(): mean value
  * std(): standard deviation
 
 * seventh part: direction
  * `X`
  * `Y` 
  * `Z`