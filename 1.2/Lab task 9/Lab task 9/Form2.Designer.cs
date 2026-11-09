namespace Lab_task_9
{
    partial class Form2
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
            this.namelb = new System.Windows.Forms.Label();
            this.retypelb = new System.Windows.Forms.Label();
            this.passwordlb = new System.Windows.Forms.Label();
            this.usernamelb = new System.Windows.Forms.Label();
            this.nametb = new System.Windows.Forms.TextBox();
            this.usernametb = new System.Windows.Forms.TextBox();
            this.passwordtb = new System.Windows.Forms.TextBox();
            this.retypetb = new System.Windows.Forms.TextBox();
            this.signupbutton = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // namelb
            // 
            this.namelb.AutoSize = true;
            this.namelb.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.namelb.Location = new System.Drawing.Point(296, 171);
            this.namelb.Name = "namelb";
            this.namelb.Size = new System.Drawing.Size(75, 25);
            this.namelb.TabIndex = 0;
            this.namelb.Text = "Name :";
            // 
            // retypelb
            // 
            this.retypelb.AutoSize = true;
            this.retypelb.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.retypelb.Location = new System.Drawing.Point(296, 329);
            this.retypelb.Name = "retypelb";
            this.retypelb.Size = new System.Drawing.Size(182, 25);
            this.retypelb.TabIndex = 1;
            this.retypelb.Text = "Re-type Password :";
            // 
            // passwordlb
            // 
            this.passwordlb.AutoSize = true;
            this.passwordlb.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.passwordlb.Location = new System.Drawing.Point(296, 277);
            this.passwordlb.Name = "passwordlb";
            this.passwordlb.Size = new System.Drawing.Size(109, 25);
            this.passwordlb.TabIndex = 2;
            this.passwordlb.Text = "Password :";
            // 
            // usernamelb
            // 
            this.usernamelb.AutoSize = true;
            this.usernamelb.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.usernamelb.Location = new System.Drawing.Point(296, 225);
            this.usernamelb.Name = "usernamelb";
            this.usernamelb.Size = new System.Drawing.Size(113, 25);
            this.usernamelb.TabIndex = 3;
            this.usernamelb.Text = "Username :";
            // 
            // nametb
            // 
            this.nametb.Location = new System.Drawing.Point(512, 175);
            this.nametb.Name = "nametb";
            this.nametb.Size = new System.Drawing.Size(244, 22);
            this.nametb.TabIndex = 4;
            // 
            // usernametb
            // 
            this.usernametb.Location = new System.Drawing.Point(512, 229);
            this.usernametb.Name = "usernametb";
            this.usernametb.Size = new System.Drawing.Size(244, 22);
            this.usernametb.TabIndex = 5;
            this.usernametb.TextChanged += new System.EventHandler(this.textBox2_TextChanged);
            // 
            // passwordtb
            // 
            this.passwordtb.Location = new System.Drawing.Point(512, 281);
            this.passwordtb.Name = "passwordtb";
            this.passwordtb.Size = new System.Drawing.Size(244, 22);
            this.passwordtb.TabIndex = 6;
            // 
            // retypetb
            // 
            this.retypetb.Location = new System.Drawing.Point(512, 333);
            this.retypetb.Name = "retypetb";
            this.retypetb.Size = new System.Drawing.Size(244, 22);
            this.retypetb.TabIndex = 7;
            // 
            // signupbutton
            // 
            this.signupbutton.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.signupbutton.Location = new System.Drawing.Point(482, 407);
            this.signupbutton.Name = "signupbutton";
            this.signupbutton.Size = new System.Drawing.Size(103, 37);
            this.signupbutton.TabIndex = 8;
            this.signupbutton.Text = "Sign Up";
            this.signupbutton.UseVisualStyleBackColor = true;
            this.signupbutton.Click += new System.EventHandler(this.button1_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(397, 476);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(308, 25);
            this.label1.TabIndex = 9;
            this.label1.Text = "Already have an account? Log in !";
            // 
            // Form2
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1114, 594);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.signupbutton);
            this.Controls.Add(this.retypetb);
            this.Controls.Add(this.passwordtb);
            this.Controls.Add(this.usernametb);
            this.Controls.Add(this.nametb);
            this.Controls.Add(this.usernamelb);
            this.Controls.Add(this.passwordlb);
            this.Controls.Add(this.retypelb);
            this.Controls.Add(this.namelb);
            this.Name = "Form2";
            this.Text = "Form2";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label namelb;
        private System.Windows.Forms.Label retypelb;
        private System.Windows.Forms.Label passwordlb;
        private System.Windows.Forms.Label usernamelb;
        private System.Windows.Forms.TextBox nametb;
        private System.Windows.Forms.TextBox usernametb;
        private System.Windows.Forms.TextBox passwordtb;
        private System.Windows.Forms.TextBox retypetb;
        private System.Windows.Forms.Button signupbutton;
        private System.Windows.Forms.Label label1;
    }
}