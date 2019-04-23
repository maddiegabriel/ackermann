-- *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
-- file:   integer_stack.adb
-- goal:   body package code for integer stack implementation in Ada!
--         includes code for functions: push, pop, stack_is_empty,
--                                      stack_top, reset_stack
-- *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-

package body integer_stack is

    type list is array(1..70000) of integer;

    type new_stack is
        record
            node : list;
            head : integer := 0;
        end record;
    this : new_stack;

    procedure push(x : in integer) is
    begin
        if this.head /= 70000 then
            this.head := this.head + 1;
            this.node(this.head) := x;
        end if;
    end push;

    procedure pop( x : out integer) is
    begin
        if this.head /= 0 then
            x := this.node(this.head);
            this.head := this.head - 1;
        end if;
    end pop;

    function stack_is_empty return boolean is
    begin
        return this.head = 0;
    end stack_is_empty;

    function stack_top return integer is
    begin
        if this.head = 0 then
            return 0;
        else
            return this.node(this.head);
        end if;
    end stack_top;

    procedure reset_stack is
    begin
        this.head := 0;
    end reset_stack;

end integer_stack;
