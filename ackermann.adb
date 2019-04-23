-- *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
-- file:   ackermann.adb
-- author: Maddie Gabriel
-- goal:   allows user to enter values m and n, then uses them to do
--         the Ackermann function calculation (non-recursively).
-- *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Calendar; use Ada.Calendar;
with integer_stack; use integer_stack;

procedure ackermann is

    function calcAckermann(m, n : in out integer) return integer is
    begin
        reset_stack;
        push(m);

        while stack_is_empty = false loop
            pop(m);

            if m = 0 then
                n := n + 1;
            elsif n = 0 then
                push(m - 1);
                m := m - 1;
                n := 1;
            else
                push(m - 1);
                push(m);
                n := n - 1;
                m := m - 1;
            end if;
        end loop;

        return n;
    end calcAckermann;

    m, n, result : integer;
    startClock, endClock : time;
    totalTime : duration;
    again : character := 'Y';

begin
    new_line;
    put_line("---------------------------------------");
    put_line("  WELCOME TO MY ACKERMANN CALCULATOR!");
    put_line("    Built with love for CIS*3190");
    put_line("    By: Maddie Gabriel (0927580)");
    put_line("---------------------------------------");
    new_line;

    loop
        -- Obtain user input for m and n integer values
        put("Please enter an integer m: ");
        get(m);
        put("Please enter an integer n: ");
        get(n);

        -- Call Ackermann function with user's input and time it!
        startClock := Clock;
        result := calcAckermann(m, n);
        endClock := Clock;
        totalTime := (endClock - startClock) * 1000;

        -- Print result and runtime to user amd ask if they want to calculate again
        put_line("Result  :: " & integer'image(result));
        put_line("Runtime :: " & duration'image(totalTime) & " milliseconds");
        new_line;
        put("Want to calculate again? (Y/N): ");
        get(again);

        exit when again = 'n' or again = 'N';
        new_line;
    end loop;

    new_line;
    put_line("---------------- THANKS AND GOODBYE! ----------------");
end ackermann;
