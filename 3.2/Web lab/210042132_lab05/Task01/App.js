import React from 'react';
import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View, Button } from 'react-native';


const COLOR_INCREMENT = 15;

export default function App() {
  const [red, setRed] = React.useState(100);
  const [green, setGreen] = React.useState(20);
  const [blue, setBlue] = React.useState(20);

  const setColor = (color, change) =>{
    switch (color){
      case 'red':
        red + change > 255 || red + change < 0 ? null : setRed(red + change);
        return;
      case 'green':
        green + change > 255 || green + change < 0 ? null : setGreen(green + change);
        return;
      case 'blue':
        blue + change > 255 || blue + change < 0 ? null : setBlue(blue + change);
        return;
      default:
        return;
    }
  };

  return (
    <View style={styles.container}>
      <View>
          <Text style={styles.label}>
            Red
          </Text>
          <View style={styles.buttonGroup}>
            <Button title="More Red" onPress={() => setColor('red', COLOR_INCREMENT)} />
            <Button title="Less Red" onPress={() => setColor('red', -COLOR_INCREMENT)} />
          </View>
      </View>
      <View>
          <Text style={styles.label}>
            Green
          </Text>
          <View style={styles.buttonGroup}>
            <Button style={styles.buttonRed} title="More Green" onPress={() => setColor('green', COLOR_INCREMENT)} />
            <Button style={styles.buttonRed} title="Less Green" onPress={() => setColor('green', -COLOR_INCREMENT)} />
          </View>
      </View>
      <View>
          <Text style={styles.label}>
            Blue
          </Text>
          <View style={styles.buttonGroup}>
            <Button title="More Blue" onPress={() => setColor('blue', COLOR_INCREMENT)} />
            <Button title="Less Blue" onPress={() => setColor('blue', -COLOR_INCREMENT)} />
          </View>
      </View>
      <View
        style={{
          height: 100,
          width: 100,
          backgroundColor: `rgb(${red},${green},${blue})`,
          marginTop: 20,
        }}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: 'white',
    alignItems: 'center',
    justifyContent: 'center',
    padding : 20,
    marginTop: 50,

  },
  label:{
    color: 'black',
    fontSize: 20,
    fontWeight: 'bold',
    textAlign: 'center',
    margin: 10,
  },
  buttonGroup: {
    margin: 5,
  },
  buttonRed:{
    back
  }
});
