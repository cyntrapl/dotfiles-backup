import app from "ags/gtk4/app"

function Bar(monitor = 0) {
  return (
    <window class="Bar" monitor={monitor}>
      <box>Content of the widget</box>
    </window>
  )
}

app.start({
  main() {
    Bar(0)
    Bar(1) // instantiate for each monitor
  },
})

