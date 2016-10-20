BBC api consumer
==========================

## Overview

BBC Radio send out text messages to DAB radios letting listeners know what the current 
programme is, and what is coming up next. This demo application can read 
schedules from the BBC website, and send out this information in sync with the programme 
broadcast. 

## Source data

The BBC publish schedules for all their radio stations on their website. For this exercise, we will 
use a subset of them to simplify things: 
 
* Radio 2: Typical of most stations 
* Radio 5 Live Sports Extra: Does not always have programmes, and there may be gaps 
between programmes 
* World Service: Has many shorter programmes 
 
The data is available in XML or JSON format, with the suffix ".xml" or ".json" returning the 
appropriate format. Using no suffix will return a human readable HTML version. The URLs for the 
XML feeds for the current day are as follows: 
 
* http://www.bbc.co.uk/radio2/programmes/schedules.xml 
* http://www.bbc.co.uk/5livesportsextra/programmes/schedules.xml 
* http://www.bbc.co.uk/worldserviceradio/programmes/schedules.xml 
 
A date can be specified in the URL if required, e.g.: 
http://www.bbc.co.uk/worldserviceradio/programmes/schedules/2011/05/18.xml 
 
A simplified guide to BBC programme metadata: 
 
* a PID is a unique identifier within the BBC and can refer to various data types 
* an episode is a distinct recording, e.g., the Richard Bacon show on 25th May 2011 
* a brand is a DJ or named programmed, e.g., "Richard Bacon" or "The Archers" 
 
The returned data is structured as follows, which is based on the XML representation, and contains 
only the interesting properties so you should check the downloaded examples for detail. We also 
hold no schema for this data, so it is possible that there may be variations such as missing 
elements. 
 
* a list of broadcasts 
* each broadcast contains a PID, and a start and end date / time, and a programme element 
for the episode 
* the episode programme element contains a type, PID, display title and subtitle, and a 
programme element for the brand (for info only: you do not need to use the brand programme element, but it can be confusing to see the nested structures if you're not 
expecting them) 
 
The schedules are for the UK only. 
## Usage

To start the application, call

    $ ruby app.rb

## Running the specs

Just call rspec from the application directory:

   $ rspec
