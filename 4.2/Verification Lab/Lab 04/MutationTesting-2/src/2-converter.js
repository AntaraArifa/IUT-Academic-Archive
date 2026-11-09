function LengthConverter(measurement, val)
{
    var result1, result2;

    if(measurement == "feets")
    {
        result1 = (val*12).toFixed(2) + " inches";
        result2 = (val/5280).toFixed(2) + " miles";
    } else if(measurement === "inches") {
        result1 = (val/12).toFixed(2) + " feets";
        result2 = (val/63360).toFixed(2) + " miles";
    } else if(measurement === "miles") {
        result1 = (val*5280).toFixed(2) + " feets";
        result2 = (val*63360).toFixed(2) + " inches";
    } else {
        return "wrong input";
    }
    return [result1, result2];
}

console.log(LengthConverter("feets", 3));
module.exports = {
    LengthConverter
}