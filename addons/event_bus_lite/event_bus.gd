extends Node

const MAX_EVENTS: int = 8

var _handlers: Dictionary = {}

func subscribe(event: String, callable: Callable) -> bool:
	if not _handlers.has(event):
		if _handlers.size() >= MAX_EVENTS:
			push_warning("EventBus Lite: max %d event types. Upgrade to PRO." % MAX_EVENTS)
			return false
		_handlers[event] = []
	if not _has_callable(event, callable):
		_handlers[event].append(callable)
	return true

func unsubscribe(event: String, callable: Callable) -> void:
	if not _handlers.has(event):
		return
	var list: Array = _handlers[event]
	for i in range(list.size() - 1, -1, -1):
		if list[i] == callable:
			list.remove_at(i)

func emit(event: String, payload = null) -> void:
	if not _handlers.has(event):
		return
	for cb in _handlers[event].duplicate():
		if cb.is_valid():
			if payload == null:
				cb.call()
			else:
				cb.call(payload)

func clear(event: String) -> void:
	_handlers.erase(event)

func clear_all() -> void:
	_handlers.clear()

func has_subscribers(event: String) -> bool:
	return _handlers.has(event) and not _handlers[event].is_empty()

func subscriber_count(event: String) -> int:
	if not _handlers.has(event):
		return 0
	return _handlers[event].size()

func registered_events() -> Array:
	return _handlers.keys()

func _has_callable(event: String, callable: Callable) -> bool:
	for cb in _handlers[event]:
		if cb == callable:
			return true
	return false
