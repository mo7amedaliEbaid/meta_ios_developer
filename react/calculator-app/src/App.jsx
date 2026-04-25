import { useState } from 'react'
import './App.css'

function parseOperand(value) {
  const n = Number(value)
  return Number.isFinite(n) ? n : 0
}

/** Only digits and basic arithmetic — blocks letters (no code injection). */
const EXPRESSION_SAFE = /^[\d+\-*/().]+$/

function evaluateExpression(raw) {
  if (raw == null || typeof raw !== 'string') return null
  const compact = raw.replace(/\s/g, '')
  if (compact === '') return null
  if (!EXPRESSION_SAFE.test(compact)) return null
  try {
    const fn = new Function(`"use strict"; return (${compact})`)
    const value = fn()
    return typeof value === 'number' && Number.isFinite(value) ? value : null
  } catch {
    return null
  }
}

function App() {
  const [result, setResult] = useState(0)
  const [input, setInput] = useState('')

  function applyOperation(op, rawValue = input) {
    const operand = parseOperand(rawValue)
    if (op === 'divide' && operand === 0) {
      return
    }

    setResult((prev) => {
      switch (op) {
        case 'add':
          return prev + operand
        case 'subtract':
          return prev - operand
        case 'multiply':
          return prev * operand
        case 'divide':
          return prev / operand
        default:
          return prev
      }
    })
  }

  function handleOperation(op) {
    applyOperation(op)
  }

  function calculateFromInput(raw) {
    const value = evaluateExpression(raw)
    if (value === null) {
      window.alert(
        'Could not evaluate that expression. Use digits and + - * / ( ). Example: 45+8 or 10*2.',
      )
      return
    }
    setResult(value)
  }

  function isEnterKey(e) {
    return e.key === 'Enter' || e.code === 'Enter' || e.code === 'NumpadEnter'
  }

  function handleInputKeyDown(e) {
    if (!isEnterKey(e)) return
    e.preventDefault()
    calculateFromInput(e.currentTarget.value)
  }

  return (
    <main className="calc">
      <h1>Simplest Working Calculator</h1>
      <p className="calc-result" aria-live="polite">
        {result}
      </p>
      <input
        className="calc-input"
        type="text"
        inputMode="decimal"
        autoComplete="off"
        value={input}
        onChange={(e) => setInput(e.target.value)}
        onKeyDown={handleInputKeyDown}
        aria-label="Number or expression (e.g. 45+8)"
      />
      <p className="calc-hint">
        For a full expression like <strong>45+8</strong>, press <kbd>Enter</kbd> or{' '}
        <strong>calculate</strong>. Use <strong>*</strong> for multiply and <strong>/</strong> for
        divide. For the running total, type one number and use <strong>add</strong>,{' '}
        <strong>subtract</strong>, <strong>multiply</strong>, or <strong>divide</strong>.
      </p>
      <div className="calc-actions">
        <button type="button" className="btn-op" onClick={() => handleOperation('add')}>
          add
        </button>
        <button
          type="button"
          className="btn-op"
          onClick={() => handleOperation('subtract')}
        >
          subtract
        </button>
        <button
          type="button"
          className="btn-op"
          onClick={() => handleOperation('multiply')}
        >
          multiply
        </button>
        <button type="button" className="btn-op" onClick={() => handleOperation('divide')}>
          divide
        </button>
        <button type="button" className="btn-calculate" onClick={() => calculateFromInput(input)}>
          calculate
        </button>
        <button type="button" className="btn-reset" onClick={() => setInput('')}>
          reset input
        </button>
        <button type="button" className="btn-reset" onClick={() => setResult(0)}>
          reset result
        </button>
      </div>
    </main>
  )
}

export default App
