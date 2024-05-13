tableextension 50100 "Sales Header Ext" extends "Sales Header"
{
    fields
    {
        field(50110; "SOL Won/Lost Quote Status"; Enum "SOL Won/Lost Status")
        {
            Caption = 'Quote Status';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if "SOL Won/Last Date" = 0DT then
                    "SOL Won/Last Date" := CurrentDateTime();
            end;
        }
        field(50111; "SOL Won/Last Date"; DateTime)
        {
            Caption = 'Won/Lost Date';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50112; "SOL Won/lost Reason Code"; Code[10])
        {
            Caption = 'Won/lost Reason Code';
            DataClassification = CustomerContent;
            TableRelation = if ("SOL Won/Lost Quote Status" = const(Won))
                "Close Opportunity Code" where(type = const(Won))
            else
            if ("SOL Won/Lost Quote Status" = const(Lost)) "Close Opportunity Code" where(type = const(Lost));
            ValidateTableRelation = false;
        }
        field(50113; "SOL Won/lost Reason Desc."; Text[100])
        {
            Caption = 'Won/lost Reason Description';
            FieldClass = FlowField;
            CalcFormula = lookup("Close Opportunity Code".Description
             where(Code = field("SOL Won/lost Reason Code")));
            Editable = false;
        }
        field(50114; "SOL Won/lost Remarks"; Text[2048])
        {
            Caption = 'Won/lost Remarks';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}