Why?
====

I have underfloor heating in a large open-plan south-facing room with bi-fold doors.

The heating takes a few hours to warm up, and to bring the room up to temperature.

When it is a sunny day, the heat from the sunlight coming through the bi-fold doors raises the room temperature much faster than the underfloor heating does.  This cause the room temperature to increase way above the thermostat set temperature, which wastes energy.

In theory, when sunny weather is forecast, turning off the underfloor heating (or more specifically reducing the thermostat set temperature) earlier than usual should avoid overheating the room, and save on energy bills.

How?
====

Using [openweathermap.org](https://openweathermap.org/forecast5) we can get the forecast cloud cover for the next day.  If the average cloud cover for the day is less than a given %, we turn down the underfloor heating in the morning to allow the heat of the sun to warm the room instead.

The heating system I have at home is [Hive by British Gas](https://my.hivehome.com/).  Unfortunately the developer API for Hive was withdrawn a few years ago.
However, Hive does have an Applet integration with [IFTTT.com](https://ifttt.com/) (If This, Then That).
IFTTT does not have a (free) trigger for the amount of sunshine forecast for the next day - otherwise this would be easy!
However, IFTTT does have a Webhook Applet called [Maker Webhooks](https://ifttt.com/maker_webhooks/details), so it is possible to create an IFTTT trigger which reduces the heating thermostat set temperature which can be called from a webhook.

