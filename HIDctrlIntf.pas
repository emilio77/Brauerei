


{
  assign a user procedure which will receive data when HID device has send it
}

{
  Scan all available HID Devices.
  When Target VID/PID equal 0 all HID entries from device manager are
  returned. To check the presence of a particular device, enter the
  required VID/PID information
}

{
  Get a Handle to the device (open it)
}

{
  Close Device
}

{
  Write NrOfBytes to HID device
}

{
  Read data from device with a time-out.
  When succesfull NrOfBytes holds the actual number of bytes
}

IMPLEMENTATION
END.

