# Aesthetics
Configure how the program looks

## Getting Started
The config file is located at `~/.config/sanbo/config.json`
The configuration will be a big hashmap, something like this:
```json
{
  "background":"(10,10,10,1)",
  "foreground":(200,200,200,1)
}
```
  
Remember the last item(in this case foreground), must not add a trailing comma

## Colors

"background":"(rgba)" --> the background color of the app,  
  
"foreground":"(rgba)" --> the foreground color(text color) of the app  
  
"line_color":"(rgba)" --> color of every line(border) in the app  
  
"app_background":"(rgba)" --> background color for the application widget
  
"sidebar_background":"(rgba)" --> background color of the sidebar
