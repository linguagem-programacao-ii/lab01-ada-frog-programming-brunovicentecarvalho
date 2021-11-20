with    Ada.Strings.Fixed, Ada.Text_IO, Ada.Integer_Text_IO;
use     Ada.Strings.Fixed, Ada.Text_IO, Ada.Integer_Text_IO;

procedure frogGame is
    -- Variaveis
    ultimoIndice : Natural;
    indiceSplit : Integer;
    pulo : Integer;
    numeroPipes : Integer;
    pipeAtual : Integer;
    puloAtual : Integer;
    String_Buffer : String(1..300) := (others => ' ');
    Sep : String := " ";

    procedure Split(Source : in String; Pos: in Integer; Value : out Integer; Remainder: out String) is
        Tmp : String(1..Source'Last);
    begin
        if Pos = Source'Last then Move(Source, Tmp);
        else Move(Source(Source'First .. Pos-1), Tmp); 
            Move(Source(Pos+1 .. Source'Last), Remainder);
        end if;
        Value := Integer'Value(Tmp);
    end Split;
begin
    --ler 1 linha
    Get_Line(Item => String_Buffer, Last => ultimoIndice);
    indiceSplit := Index(Source => String_Buffer, Pattern => Sep, From => 1);

    Split(Source => String_Buffer, Pos => indiceSplit, Value => pulo, Remainder => String_Buffer);
    Split(Source => String_Buffer, Pos => String_Buffer'Last, Value => numeroPipes, Remainder => String_Buffer);

    --ler 2 linha
    Get_Line(Item => String_Buffer, Last => ultimoIndice);
    
    for I in 1 .. numeroPipes loop

        indiceSplit := Index(Source => String_Buffer, Pattern => Sep, From => 1);
        Split(Source => String_Buffer, Pos => indiceSplit, Value => puloAtual, Remainder => String_Buffer);
        
        if I /= 1 and abs(puloAtual - pipeAtual) > pulo then
            Put_Line("GAME OVER");
            exit;
        end if;

        pipeAtual := puloAtual;

        if I = numeroPipes then
            Put_Line("YOU WIN");
        end if;

    end loop;
end frogGame;