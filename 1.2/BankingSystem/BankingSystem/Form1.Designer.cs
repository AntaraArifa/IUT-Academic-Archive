namespace BankingSystem
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.amountTextBox = new System.Windows.Forms.TextBox();
            this.depositButton = new System.Windows.Forms.Button();
            this.withdrawButton = new System.Windows.Forms.Button();
            this.showbalanceButton = new System.Windows.Forms.Button();
            this.accnumTextBox = new System.Windows.Forms.TextBox();
            this.accnumLabel = new System.Windows.Forms.Label();
            this.amountLabel = new System.Windows.Forms.Label();
            this.nameTextBox = new System.Windows.Forms.TextBox();
            this.indepTextBox = new System.Windows.Forms.TextBox();
            this.branchcomboBox = new System.Windows.Forms.ComboBox();
            this.acctypecomboBox = new System.Windows.Forms.ComboBox();
            this.createaccButton = new System.Windows.Forms.Button();
            this.BanknameLabel = new System.Windows.Forms.Label();
            this.nameLabel = new System.Windows.Forms.Label();
            this.branchLabel = new System.Windows.Forms.Label();
            this.accnoLabel = new System.Windows.Forms.Label();
            this.inidepLabel = new System.Windows.Forms.Label();
            this.acctypeLabel = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.suspendaccButton = new System.Windows.Forms.Button();
            this.showaccinfoButton = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // amountTextBox
            // 
            this.amountTextBox.Location = new System.Drawing.Point(1000, 80);
            this.amountTextBox.Name = "amountTextBox";
            this.amountTextBox.Size = new System.Drawing.Size(253, 22);
            this.amountTextBox.TabIndex = 0;
            this.amountTextBox.TextChanged += new System.EventHandler(this.amountTextBox_TextChanged);
            // 
            // depositButton
            // 
            this.depositButton.Location = new System.Drawing.Point(1000, 124);
            this.depositButton.Name = "depositButton";
            this.depositButton.Size = new System.Drawing.Size(253, 39);
            this.depositButton.TabIndex = 1;
            this.depositButton.Text = "Deposit";
            this.depositButton.UseVisualStyleBackColor = true;
            this.depositButton.Click += new System.EventHandler(this.depositButton_Click);
            // 
            // withdrawButton
            // 
            this.withdrawButton.Location = new System.Drawing.Point(1000, 182);
            this.withdrawButton.Name = "withdrawButton";
            this.withdrawButton.Size = new System.Drawing.Size(253, 36);
            this.withdrawButton.TabIndex = 2;
            this.withdrawButton.Text = "Withdraw";
            this.withdrawButton.UseVisualStyleBackColor = true;
            this.withdrawButton.Click += new System.EventHandler(this.withdrawButton_Click);
            // 
            // showbalanceButton
            // 
            this.showbalanceButton.Location = new System.Drawing.Point(1000, 224);
            this.showbalanceButton.Name = "showbalanceButton";
            this.showbalanceButton.Size = new System.Drawing.Size(253, 42);
            this.showbalanceButton.TabIndex = 3;
            this.showbalanceButton.Text = "Show Balance";
            this.showbalanceButton.UseVisualStyleBackColor = true;
            this.showbalanceButton.Click += new System.EventHandler(this.showbalanceButton_Click);
            // 
            // accnumTextBox
            // 
            this.accnumTextBox.Location = new System.Drawing.Point(1000, 39);
            this.accnumTextBox.Name = "accnumTextBox";
            this.accnumTextBox.Size = new System.Drawing.Size(253, 22);
            this.accnumTextBox.TabIndex = 4;
            // 
            // accnumLabel
            // 
            this.accnumLabel.AutoSize = true;
            this.accnumLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.accnumLabel.Location = new System.Drawing.Point(863, 41);
            this.accnumLabel.Name = "accnumLabel";
            this.accnumLabel.Size = new System.Drawing.Size(100, 20);
            this.accnumLabel.TabIndex = 5;
            this.accnumLabel.Text = "Account No.";
            // 
            // amountLabel
            // 
            this.amountLabel.AutoSize = true;
            this.amountLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.amountLabel.Location = new System.Drawing.Point(863, 82);
            this.amountLabel.Name = "amountLabel";
            this.amountLabel.Size = new System.Drawing.Size(118, 20);
            this.amountLabel.TabIndex = 6;
            this.amountLabel.Text = "Amount (BDT)";
            this.amountLabel.Click += new System.EventHandler(this.amountLabel_Click);
            // 
            // nameTextBox
            // 
            this.nameTextBox.Location = new System.Drawing.Point(146, 80);
            this.nameTextBox.Name = "nameTextBox";
            this.nameTextBox.Size = new System.Drawing.Size(171, 22);
            this.nameTextBox.TabIndex = 7;
            this.nameTextBox.TextChanged += new System.EventHandler(this.nameTextBox_TextChanged);
            // 
            // indepTextBox
            // 
            this.indepTextBox.Location = new System.Drawing.Point(146, 215);
            this.indepTextBox.Name = "indepTextBox";
            this.indepTextBox.Size = new System.Drawing.Size(171, 22);
            this.indepTextBox.TabIndex = 8;
            // 
            // branchcomboBox
            // 
            this.branchcomboBox.FormattingEnabled = true;
            this.branchcomboBox.Items.AddRange(new object[] {
            "Gazipur",
            "Uttara",
            "Motijheel",
            "Rajshahi"});
            this.branchcomboBox.Location = new System.Drawing.Point(146, 124);
            this.branchcomboBox.Name = "branchcomboBox";
            this.branchcomboBox.Size = new System.Drawing.Size(171, 24);
            this.branchcomboBox.TabIndex = 9;
            // 
            // acctypecomboBox
            // 
            this.acctypecomboBox.FormattingEnabled = true;
            this.acctypecomboBox.Items.AddRange(new object[] {
            "Savings",
            "Current",
            "DPS"});
            this.acctypecomboBox.Location = new System.Drawing.Point(146, 168);
            this.acctypecomboBox.Name = "acctypecomboBox";
            this.acctypecomboBox.Size = new System.Drawing.Size(171, 24);
            this.acctypecomboBox.TabIndex = 10;
            // 
            // createaccButton
            // 
            this.createaccButton.Location = new System.Drawing.Point(146, 253);
            this.createaccButton.Name = "createaccButton";
            this.createaccButton.Size = new System.Drawing.Size(171, 33);
            this.createaccButton.TabIndex = 11;
            this.createaccButton.Text = "Create Account";
            this.createaccButton.UseVisualStyleBackColor = true;
            this.createaccButton.Click += new System.EventHandler(this.createaccButton_Click);
            // 
            // BanknameLabel
            // 
            this.BanknameLabel.AutoSize = true;
            this.BanknameLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.BanknameLabel.Location = new System.Drawing.Point(493, 9);
            this.BanknameLabel.Name = "BanknameLabel";
            this.BanknameLabel.Size = new System.Drawing.Size(297, 25);
            this.BanknameLabel.TabIndex = 12;
            this.BanknameLabel.Text = "AB Bank Limited, Bangladesh";
            this.BanknameLabel.Click += new System.EventHandler(this.label1_Click);
            // 
            // nameLabel
            // 
            this.nameLabel.AutoSize = true;
            this.nameLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.nameLabel.Location = new System.Drawing.Point(1, 82);
            this.nameLabel.Name = "nameLabel";
            this.nameLabel.Size = new System.Drawing.Size(63, 20);
            this.nameLabel.TabIndex = 13;
            this.nameLabel.Text = "Name :";
            // 
            // branchLabel
            // 
            this.branchLabel.AutoSize = true;
            this.branchLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.branchLabel.Location = new System.Drawing.Point(1, 128);
            this.branchLabel.Name = "branchLabel";
            this.branchLabel.Size = new System.Drawing.Size(73, 20);
            this.branchLabel.TabIndex = 14;
            this.branchLabel.Text = "Branch :";
            this.branchLabel.Click += new System.EventHandler(this.label2_Click);
            // 
            // accnoLabel
            // 
            this.accnoLabel.AutoSize = true;
            this.accnoLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.accnoLabel.Location = new System.Drawing.Point(1, 41);
            this.accnoLabel.Name = "accnoLabel";
            this.accnoLabel.Size = new System.Drawing.Size(110, 20);
            this.accnoLabel.TabIndex = 15;
            this.accnoLabel.Text = "Account No. :";
            // 
            // inidepLabel
            // 
            this.inidepLabel.AutoSize = true;
            this.inidepLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.inidepLabel.Location = new System.Drawing.Point(1, 217);
            this.inidepLabel.Name = "inidepLabel";
            this.inidepLabel.Size = new System.Drawing.Size(121, 20);
            this.inidepLabel.TabIndex = 17;
            this.inidepLabel.Text = "Initial Deposit :";
            // 
            // acctypeLabel
            // 
            this.acctypeLabel.AutoSize = true;
            this.acctypeLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.acctypeLabel.Location = new System.Drawing.Point(1, 172);
            this.acctypeLabel.Name = "acctypeLabel";
            this.acctypeLabel.Size = new System.Drawing.Size(121, 20);
            this.acctypeLabel.TabIndex = 18;
            this.acctypeLabel.Text = "Account Type :";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(394, 82);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(100, 20);
            this.label1.TabIndex = 19;
            this.label1.Text = "Account No.";
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(527, 80);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(253, 22);
            this.textBox1.TabIndex = 20;
            // 
            // suspendaccButton
            // 
            this.suspendaccButton.Location = new System.Drawing.Point(527, 182);
            this.suspendaccButton.Name = "suspendaccButton";
            this.suspendaccButton.Size = new System.Drawing.Size(253, 36);
            this.suspendaccButton.TabIndex = 21;
            this.suspendaccButton.Text = "Suspend Account";
            this.suspendaccButton.UseVisualStyleBackColor = true;
            // 
            // showaccinfoButton
            // 
            this.showaccinfoButton.Location = new System.Drawing.Point(527, 128);
            this.showaccinfoButton.Name = "showaccinfoButton";
            this.showaccinfoButton.Size = new System.Drawing.Size(253, 37);
            this.showaccinfoButton.TabIndex = 22;
            this.showaccinfoButton.Text = "Show Account Information";
            this.showaccinfoButton.UseVisualStyleBackColor = true;
            this.showaccinfoButton.Click += new System.EventHandler(this.showaccinfoButton_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1265, 523);
            this.Controls.Add(this.showaccinfoButton);
            this.Controls.Add(this.suspendaccButton);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.acctypeLabel);
            this.Controls.Add(this.inidepLabel);
            this.Controls.Add(this.accnoLabel);
            this.Controls.Add(this.branchLabel);
            this.Controls.Add(this.nameLabel);
            this.Controls.Add(this.BanknameLabel);
            this.Controls.Add(this.createaccButton);
            this.Controls.Add(this.acctypecomboBox);
            this.Controls.Add(this.branchcomboBox);
            this.Controls.Add(this.indepTextBox);
            this.Controls.Add(this.nameTextBox);
            this.Controls.Add(this.amountLabel);
            this.Controls.Add(this.accnumLabel);
            this.Controls.Add(this.accnumTextBox);
            this.Controls.Add(this.showbalanceButton);
            this.Controls.Add(this.withdrawButton);
            this.Controls.Add(this.depositButton);
            this.Controls.Add(this.amountTextBox);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox amountTextBox;
        private System.Windows.Forms.Button depositButton;
        private System.Windows.Forms.Button withdrawButton;
        private System.Windows.Forms.Button showbalanceButton;
        private System.Windows.Forms.TextBox accnumTextBox;
        private System.Windows.Forms.Label accnumLabel;
        private System.Windows.Forms.Label amountLabel;
        private System.Windows.Forms.TextBox nameTextBox;
        private System.Windows.Forms.TextBox indepTextBox;
        private System.Windows.Forms.ComboBox branchcomboBox;
        private System.Windows.Forms.ComboBox acctypecomboBox;
        private System.Windows.Forms.Button createaccButton;
        private System.Windows.Forms.Label BanknameLabel;
        private System.Windows.Forms.Label nameLabel;
        private System.Windows.Forms.Label branchLabel;
        private System.Windows.Forms.Label accnoLabel;
        private System.Windows.Forms.Label inidepLabel;
        private System.Windows.Forms.Label acctypeLabel;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Button suspendaccButton;
        private System.Windows.Forms.Button showaccinfoButton;
    }
}

