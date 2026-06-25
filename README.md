# Event Bus Lite — Godot 4

Free global pub/sub event dispatcher for Godot 4 via autoload. Decouple your systems — emit and listen to named events from anywhere. Lite supports up to 8 event types.

## Features (Lite — Free)

- `subscribe(event, callable)` / `unsubscribe(event, callable)`
- `emit(event, payload)` — broadcast to all subscribers
- `clear(event)` / `clear_all()`
- `has_subscribers(event)` / `subscriber_count(event)`
- `registered_events()`
- Up to 8 event types · zero dependencies · pure GDScript autoload

## Quick Start

```gdscript
# Add addons/event_bus_lite/event_bus.gd as autoload named "EventBus"
EventBus.subscribe("player_died", _on_player_died)
EventBus.emit("player_died", {"score": 1200})

func _on_player_died(payload):
    print("Game over, score: ", payload["score"])
```

## Upgrade to PRO

[Event Bus PRO](https://godot-forge.itch.io/event-bus-pro-godot) adds unlimited event types, priorities, once-handlers, event history and wildcard subscriptions.

---
Made with ♥ by [GodotForge](https://itch.io/profile/godot-forge)
