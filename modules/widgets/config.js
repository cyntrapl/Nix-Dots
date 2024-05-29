const myLabel = Widget.Label({
    label: '',
})

const myBar = Widget.Window({
    name: 'bar',
    anchor: ['top', 'left', 'right'],
    child: myLabel,
})

App.config({ windows: [myBar] })
