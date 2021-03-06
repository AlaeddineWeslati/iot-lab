Tools Description
=================

See the associated script files for more information.


Serial aggregator
-----------------

Aggregate all the serial links of an experiment and print it to stdout.

### Usage ###

    $ experiment-cli get -r -i <exp_id> | ./serial_aggregator.py
    1395240359.286712;node46; Type Enter to stop printing this help
    1395240359.286853;node46;
    1395240359.292523;node9;
    1395240359.292675;node9;Senslab Simple Demo program
    1395240359.292820;node9;Type command
    1395240359.293094;node9;    h:  print this help
    1395240359.293241;node9;    t:  temperature measure
    1395240359.293612;node9;    l:  luminosity measure
    1395240359.293760;node9;    s:  send a radio packet
    1395240359.294044;node9;
    1395240359.294212;node9; Type Enter to stop printing this help
    1395240359.294781;node37;
    1395240359.294949;node37;Senslab Simple Demo program
    1395240359.295098;node37;Type command
    ...



CLI JSON Parser
---------------

It allows extracting informations from jsons directly from command line.

It parses stdint and apply the argument on the equivalent python object as a
`(lambda x: <argument>)`

### Usage ###

Get all 'Alive' nodes from Grenoble site

    $ experiment-cli info -li | ./parse_json.py "[entry['$HOSTNAME']['wsn430']['Alive'] for entry in x['items'] if '$HOSTNAME' in entry.keys()][0]"
    1-7+9-47+49+51+53-67+70-72+74-99+101-102+126-129+131-134+136-166+168-169+171-183+185-191+194-201+204-215+217-222+224-227+229-235+237-251+253-255

OML plotter
-----------

oml_plot.py

plot oml filename [-tpvcah] -i <filename> or --input=<filename>

for time verification --time or -t
for begin sample --begin=<sample_beg> or -b <sample_beg>
for end sample --end=<sample_end> or -e <sample_end>
for label title plot --label=<title> or -l <title>
for plot consumption --power or -p
for plot voltage --voltage or -v
for plot current --current or -c
for all plot --all or -a
for help use --help or -h


IoT-LAB Firmware Autotest
-------------------------

Base class to help writing automated firmware testing on IoT-LAB.
Inspired by what is done in Contiki regression-tests using Cooja.

BETA script (at 2014-03-25)

