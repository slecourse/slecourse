class FsmException(Exception):
    # Base class for all FSM exceptions
    pass

class FsmParseException(FsmException):
    pass

class IllegalSymbolException(FsmException):
    pass

class InfeasibleSymbolException(FsmException):
    pass

class OkFsmException(FsmException):
    # Base class for all OkFSM exceptions
    pass

class DistinctIdsException(OkFsmException):
    pass

class SingleInitialException(OkFsmException):
    pass

class DeterministicException(OkFsmException):
    pass

class ResolvableException(OkFsmException):
    pass

class ReachableException(OkFsmException):
    pass
