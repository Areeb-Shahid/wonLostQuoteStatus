pageextension 50115 "SOL Sales Quote Ext" extends "Sales Quote"
{
    layout
    {
        addafter("Due Date")
        {
            field("Quote Status"; Rec."SOL Won/Lost Quote Status")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Status of the Quote.';
            }
            field("Won/Last Date"; Rec."SOL Won/Last Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Date Closing the Quote.';
            }
            field("Won/lost Reason Code"; Rec."SOL Won/lost Reason Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Reason Closing the Quote.';
            }
            field("Won/lost Reason Desc."; Rec."SOL Won/lost Reason Desc.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Reason Closing the Quote.';
            }
            field("Won/lost Remarks"; Rec."SOL Won/lost Remarks")
            {
                ApplicationArea = All;
                ToolTip = 'Specified an Extra Remark on the Quote Status.';
            }
        }
    }

    var
        myInt: Integer;
}