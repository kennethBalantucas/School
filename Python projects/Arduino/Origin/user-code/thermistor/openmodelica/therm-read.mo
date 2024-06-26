model therm_read "Thermistor Readings"
  extends Modelica.Icons.Example;
  import sComm = Arduino.SerialCommunication.Functions;
  import strm = Modelica.Utilities.Streams;
  Integer ok(fixed = false);
  Integer val(fixed = false);
  Integer c_ok(fixed = false);
algorithm
  when initial() then
    ok := sComm.open_serial(1, 2, 115200) "At port 2 with baudrate of 115200";
    sComm.delay(2000);
  end when;
  if ok <> 0 then
    strm.print("Unable to open serial port, please check");
  else
    val := sComm.cmd_analog_in(1, 4) "read analog pin 5 (ldr)";
    strm.print("Thermistor Readings: " + String(val));
    sComm.delay(500);
  end if;
  when terminal() then
    c_ok := sComm.close_serial(1) "To close the connection safely";
  end when;
  annotation(
    experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-6, Interval = 1));
end therm_read;
