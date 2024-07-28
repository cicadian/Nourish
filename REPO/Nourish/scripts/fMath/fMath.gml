enum __OPERATOR{
	EQUALS,
	LESS,
	GREATER,
	LESS_EQUAL,
	GREATER_EQUAL,
	
	NOT_EQUALS,
	NOT_LESS,
	NOT_GREATER,
	NOT_LESS_EQUAL,
	NOT_GREATER_EQUAL
}

function is_even(_value){ // Equal to !is_odd
	return (_value mod 2 == 0);
}
function is_odd(_value){  // Equal to !is_even
	return (_value mod 2 == 1);
}

function comparison(_value1, _value2, _operator){
	switch (_operator){
		case __OPERATOR.EQUALS:
			return _value1 == _value2;
		case __OPERATOR.LESS:
			return _value1 < _value2;
		case __OPERATOR.GREATER:
			return _value1 > _value2;
		case __OPERATOR.LESS_EQUAL:
			return _value1 <= _value2;
		case __OPERATOR.GREATER_EQUAL:
			return _value1 >= _value2;
		case __OPERATOR.NOT_EQUALS:
			return _value1 != _value2;
		case __OPERATOR.NOT_LESS:
			return !(_value1 < _value2);
		case __OPERATOR.NOT_GREATER:
			return !(_value1 > _value2);
		case __OPERATOR.NOT_LESS_EQUAL:
			return !(_value1 <= _value2);
		case __OPERATOR.NOT_GREATER_EQUAL:
			return !(_value1 >= _value2);
	}
}