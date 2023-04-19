As most 3rd party addon aircraft for X-Plane use custom datarefs, creating an universal Autopilot or radio panel requires you swapping mobiflight profiles and/or XPUIPC offset config files depending on the plane you are using. However, with this lua script, you have universal datarefs and commands that work for every plane. Example XPUIPC config and a spreadsheet with the offsets are provided, however feel free to edit them as you like and you can also modify the lua file to support more planes. 

The way the script works is it detectets the plane you are using, and syncs the custom datarefs with the Universal datarefs.

Currently supported addon planes: 
- Zibo B738
- Toliss A319 (I assume other Toliss planes use the same datarefs, so you can easily just add more ICAO codes on line 184.)
- Inibuilds A306

I will provide support for more planes at some point.

For pictures, wiring diagrams and 3d files for my own AP and RADIO panels can be found here: 
