<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Simple Calculator</title>
  <style>
    body {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
      background-color: #f4f4f9;
      font-family: Arial, sans-serif;
    }
    .calculator {
      width: 250px;
      padding: 20px;
      background: #fff;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }
    .calculator-display {
      width: 100%;
      height: 50px;
      font-size: 24px;
      text-align: right;
      padding: 10px;
      border: 1px solid #ddd;
      margin-bottom: 10px;
      border-radius: 4px;
    }
    .buttons {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: 10px;
    }
    .button {
      height: 50px;
      font-size: 18px;
      cursor: pointer;
      border: none;
      background-color: #ff6b6b;
      color: white;
      border-radius: 4px;
    }
    .button:active {
      background-color: #ff5252;
    }
    .button.operator {
      background-color: #6b93ff;
    }
  </style>
</head>
<body>
  <div class="calculator">
    <input type="text" id="display" class="calculator-display" disabled>
    <div class="buttons">
      <button class="button" onclick="appendNumber('7')">7</button>
      <button class="button" onclick="appendNumber('8')">8</button>
      <button class="button" onclick="appendNumber('9')">9</button>
      <button class="button operator" onclick="chooseOperation('/')">/</button>
      <button class="button" onclick="appendNumber('4')">4</button>
      <button class="button" onclick="appendNumber('5')">5</button>
      <button class="button" onclick="appendNumber('6')">6</button>
      <button class="button operator" onclick="chooseOperation('*')">*</button>
      <button class="button" onclick="appendNumber('1')">1</button>
      <button class="button" onclick="appendNumber('2')">2</button>
      <button class="button" onclick="appendNumber('3')">3</button>
      <button class="button operator" onclick="chooseOperation('-')">-</button>
      <button class="button" onclick="appendNumber('0')">0</button>
      <button class="button" onclick="appendNumber('.')">.</button>
      <button class="button operator" onclick="compute()">=</button>
      <button class="button operator" onclick="chooseOperation('+')">+</button>
      <button class="button" onclick="clearDisplay()">C</button>
    </div>
  </div>

  <script>
    let currentOperand = '';
    let previousOperand = '';
    let operation = undefined;

    function appendNumber(number) {
      if (number === '.' && currentOperand.includes('.')) return;
      currentOperand = currentOperand.toString() + number.toString();
      updateDisplay();
    }

    function chooseOperation(op) {
      if (currentOperand === '') return;
      if (previousOperand !== '') {
        compute();
      }
      operation = op;
      previousOperand = currentOperand;
      currentOperand = '';
      updateDisplay();
    }

    function compute() {
      let computation;
      const prev = parseFloat(previousOperand);
      const current = parseFloat(currentOperand);
      if (isNaN(prev) || isNaN(current)) return;
      switch (operation) {
        case '+':
          computation = prev + current;
          break;
        case '-':
          computation = prev - current;
          break;
        case '*':
          computation = prev * current;
          break;
        case '/':
          computation = prev / current;
          break;
        default:
          return;
      }
      currentOperand = computation;
      operation = undefined;
      previousOperand = '';
      updateDisplay();
    }

    function clearDisplay() {
      currentOperand = '';
      previousOperand = '';
      operation = undefined;
      updateDisplay();
    }

    function updateDisplay() {
      const display = document.getElementById('display');
      display.value = previousOperand + (operation || '') + currentOperand;
    }
  </script>
</body>
</html>
