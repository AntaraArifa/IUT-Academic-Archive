import * as SQLite from "expo-sqlite";

let db: SQLite.SQLiteDatabase | null = null;

export const initDatabase = async () => {
  if (!db) {
    db = await SQLite.openDatabaseAsync("expenses.db");
  }

  await db.execAsync(`
    CREATE TABLE IF NOT EXISTS expenses (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT NOT NULL,
      amount REAL NOT NULL,
      category TEXT NOT NULL,
      date TEXT NOT NULL,
      description TEXT,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP
    );
  `);
};


async function ensureDb() {
  if (!db) {
    db = await SQLite.openDatabaseAsync("expenses.db");
  }
}

export const getExpenses = async () => {
  await ensureDb();
  return await db!.getAllAsync("SELECT * FROM expenses ORDER BY date DESC, created_at DESC");
};

export const addExpenses = async (expense) => {
  await ensureDb();
  const result = await db!.runAsync(
    `INSERT INTO expenses (title, amount, category, date, description)
     VALUES (?, ?, ?, ?, ?)`,
    expense.title,
    expense.amount,
    expense.category,
    expense.date,
    expense.description ?? null
  );
  return result.lastInsertRowId;
};
export const updateExpense = async (id: number, expense) => {
  await ensureDb();
  const result = await db!.runAsync(
    `UPDATE expenses 
     SET title = ?, amount = ?, category = ?, date = ?, description = ? 
     WHERE id = ?`,
    expense.title,
    expense.amount,
    expense.category,
    expense.date,
    expense.description ?? null,
    id
  );
  return result.changes; 
};

export const deleteExpense = async (id: number) => {
  await ensureDb();
  const result = await db!.runAsync(
    "DELETE FROM expenses WHERE id = ?",
    id
  );
  return result.changes; 
};
export const clearAllExpenses = async () => {
  await ensureDb();
  const result = await db!.runAsync("DELETE FROM expenses");
  return result.changes; 
};
