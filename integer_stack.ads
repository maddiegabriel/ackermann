-- *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
-- file:   integer_stack.ads
-- goal:   specification package for Ada integer stack implementation!
--         specifies functions: push, pop, stack_is_empty,
--                              stack_top, reset_stack
-- *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-

package integer_stack is
    procedure push(x : in integer);
    procedure pop(x : out integer);
    function stack_is_empty return boolean;
    function stack_top return integer;
    procedure reset_stack;
end integer_stack;
