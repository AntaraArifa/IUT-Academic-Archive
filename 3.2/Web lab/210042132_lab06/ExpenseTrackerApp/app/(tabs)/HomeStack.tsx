import { createStackNavigator } from "@react-navigation/stack";
import Home from ".";
import ExpenseDetails from "./ExpenseDetails";
import EditExpense from "./EditExpense";

const Stack = createStackNavigator();

export default function HomeStack() {
  return (
    <Stack.Navigator
      screenOptions={{
        headerStyle: {
          backgroundColor: "#2196F3",
        },
        headerTintColor: "#fff",
        headerTitleStyle: { fontWeight: "bold" },
        headerTransparent: false, 
      }}
    >
      <Stack.Screen
        name="ExpenseList"
        component={Home}
        options={{
          title: "My Expenses",
        }}
      />
      <Stack.Screen
        name="ExpenseDetails"
        component={ExpenseDetails}
        options={{ title: "Expense Details" }}
      />
      <Stack.Screen
        name="EditExpense"
        component={EditExpense}
        options={{ title: "Edit Expense" }}
      />
    </Stack.Navigator>
  );
}
