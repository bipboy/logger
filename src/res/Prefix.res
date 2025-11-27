let padding = (n: int) => {
  switch n {
  | n if n < 10 => "0" ++ Belt_Int.toString(n)
  | _ => "" ++ Belt_Int.toString(n)
  }
}

let ts = () => {
  let date = Date.make()
  open Js.Array2
  [
    date->Date.getHours->padding,
    date->Date.getMinutes->padding,
    date->Date.getSeconds->padding,
  ]->Array.joinUnsafe(":") ++
  "." ++
  date->Date.getMilliseconds->Int.toFloat->Float.toString
}

@genType
let prefixFn = (~logLevelsType, ~name) => {
  `[${logLevelsType}] ${ts()} ${name}`
}
