tableextension 50101 "Sales Header Archive Ext" extends "Sales Header Archive"
{
    fields
    {
        field(50110; "SOL Quote Status"; Enum "SOL Won/Lost Status")
        {
            Caption = 'Quote Status';
            DataClassification = CustomerContent;
        }
        field(50111; "SOL Won/lost Date"; DateTime)
        {
            Caption = 'Won/lost Date';
            DataClassification = CustomerContent;
        }
        field(50112; "SOL Won/lost Reason Code"; Code[10])
        {
            Caption = 'Won/lost Reason Code';
            DataClassification = CustomerContent;
            TableRelation = if ("SOL Quote Status" = const(Won))
                "Close Opportunity Code" where(type = const(Won))
            else
            if ("SOL Quote Status" = const(Lost)) "Close Opportunity Code" where(type = const(Lost));
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
    var
        myInt: Integer;
}