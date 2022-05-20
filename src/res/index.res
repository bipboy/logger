let padding = (n: int) => {
  switch n {
  | n if n < 10 => "0" ++ Belt_Int.toString(n)
  | _ => "" ++ Belt_Int.toString(n)
  }
}

let ts = () => {
  let date = Js.Date.make()
  open Js.Array2
  [
    date->Js.Date.getMinutes->Belt.Float.toInt->padding,
    date->Js.Date.getSeconds->Belt.Float.toInt->padding,
  ]->joinWith(":") ++
  "." ++
  date->Js.Date.getMilliseconds->Belt.Float.toString
}

@genType
let prefixFn = (~logLevelsType, ~name) => {
  `[${logLevelsType}] ${ts()} ${name}`
}