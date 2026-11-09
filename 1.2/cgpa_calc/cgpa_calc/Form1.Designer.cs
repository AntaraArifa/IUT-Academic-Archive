namespace cgpa_calc
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
            this.Course_label = new System.Windows.Forms.Label();
            this.Mid_label = new System.Windows.Forms.Label();
            this.Final_label = new System.Windows.Forms.Label();
            this.Quiz2_label = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.Quiz4_label = new System.Windows.Forms.Label();
            this.Quiz3_label = new System.Windows.Forms.Label();
            this.Attendance_label = new System.Windows.Forms.Label();
            this.course_comboBox = new System.Windows.Forms.ComboBox();
            this.final_textBox = new System.Windows.Forms.TextBox();
            this.quiz3_textBox = new System.Windows.Forms.TextBox();
            this.quiz2_textBox = new System.Windows.Forms.TextBox();
            this.quiz1_textBox = new System.Windows.Forms.TextBox();
            this.mid_textBox = new System.Windows.Forms.TextBox();
            this.quiz4_textBox = new System.Windows.Forms.TextBox();
            this.attendance_textBox = new System.Windows.Forms.TextBox();
            this.Result_box = new System.Windows.Forms.ListBox();
            this.Add_button = new System.Windows.Forms.Button();
            this.Submit_button = new System.Windows.Forms.Button();
            this.cgpa_label = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // Course_label
            // 
            this.Course_label.AutoSize = true;
            this.Course_label.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Course_label.Location = new System.Drawing.Point(111, 24);
            this.Course_label.Name = "Course_label";
            this.Course_label.Size = new System.Drawing.Size(76, 25);
            this.Course_label.TabIndex = 0;
            this.Course_label.Text = "Course";
            // 
            // Mid_label
            // 
            this.Mid_label.AutoSize = true;
            this.Mid_label.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Mid_label.Location = new System.Drawing.Point(111, 120);
            this.Mid_label.Name = "Mid_label";
            this.Mid_label.Size = new System.Drawing.Size(44, 25);
            this.Mid_label.TabIndex = 1;
            this.Mid_label.Text = "Mid";
            this.Mid_label.Click += new System.EventHandler(this.Mid_label_Click);
            // 
            // Final_label
            // 
            this.Final_label.AutoSize = true;
            this.Final_label.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Final_label.Location = new System.Drawing.Point(111, 78);
            this.Final_label.Name = "Final_label";
            this.Final_label.Size = new System.Drawing.Size(54, 25);
            this.Final_label.TabIndex = 2;
            this.Final_label.Text = "Final";
            this.Final_label.Click += new System.EventHandler(this.label2_Click);
            // 
            // Quiz2_label
            // 
            this.Quiz2_label.AutoSize = true;
            this.Quiz2_label.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Quiz2_label.Location = new System.Drawing.Point(111, 202);
            this.Quiz2_label.Name = "Quiz2_label";
            this.Quiz2_label.Size = new System.Drawing.Size(64, 25);
            this.Quiz2_label.TabIndex = 3;
            this.Quiz2_label.Text = "Quiz2";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(111, 161);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(64, 25);
            this.label1.TabIndex = 4;
            this.label1.Text = "Quiz1";
            this.label1.Click += new System.EventHandler(this.label1_Click);
            // 
            // Quiz4_label
            // 
            this.Quiz4_label.AutoSize = true;
            this.Quiz4_label.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Quiz4_label.Location = new System.Drawing.Point(111, 300);
            this.Quiz4_label.Name = "Quiz4_label";
            this.Quiz4_label.Size = new System.Drawing.Size(64, 25);
            this.Quiz4_label.TabIndex = 5;
            this.Quiz4_label.Text = "Quiz4";
            // 
            // Quiz3_label
            // 
            this.Quiz3_label.AutoSize = true;
            this.Quiz3_label.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Quiz3_label.Location = new System.Drawing.Point(111, 251);
            this.Quiz3_label.Name = "Quiz3_label";
            this.Quiz3_label.Size = new System.Drawing.Size(64, 25);
            this.Quiz3_label.TabIndex = 6;
            this.Quiz3_label.Text = "Quiz3";
            // 
            // Attendance_label
            // 
            this.Attendance_label.AutoSize = true;
            this.Attendance_label.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Attendance_label.Location = new System.Drawing.Point(111, 346);
            this.Attendance_label.Name = "Attendance_label";
            this.Attendance_label.Size = new System.Drawing.Size(112, 25);
            this.Attendance_label.TabIndex = 7;
            this.Attendance_label.Text = "Attendance";
            // 
            // course_comboBox
            // 
            this.course_comboBox.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.course_comboBox.FormattingEnabled = true;
            this.course_comboBox.Items.AddRange(new object[] {
            "SWE 4201",
            "CSE 4205",
            "CSE 4207",
            "MATH 4241",
            "HUM 4247",
            "HUM 4249"});
            this.course_comboBox.Location = new System.Drawing.Point(261, 24);
            this.course_comboBox.Name = "course_comboBox";
            this.course_comboBox.Size = new System.Drawing.Size(153, 28);
            this.course_comboBox.TabIndex = 8;
            // 
            // final_textBox
            // 
            this.final_textBox.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.final_textBox.Location = new System.Drawing.Point(261, 78);
            this.final_textBox.Name = "final_textBox";
            this.final_textBox.Size = new System.Drawing.Size(153, 27);
            this.final_textBox.TabIndex = 9;
            // 
            // quiz3_textBox
            // 
            this.quiz3_textBox.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.quiz3_textBox.Location = new System.Drawing.Point(261, 251);
            this.quiz3_textBox.Name = "quiz3_textBox";
            this.quiz3_textBox.Size = new System.Drawing.Size(153, 27);
            this.quiz3_textBox.TabIndex = 10;
            // 
            // quiz2_textBox
            // 
            this.quiz2_textBox.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.quiz2_textBox.Location = new System.Drawing.Point(261, 202);
            this.quiz2_textBox.Name = "quiz2_textBox";
            this.quiz2_textBox.Size = new System.Drawing.Size(153, 27);
            this.quiz2_textBox.TabIndex = 11;
            // 
            // quiz1_textBox
            // 
            this.quiz1_textBox.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.quiz1_textBox.Location = new System.Drawing.Point(261, 161);
            this.quiz1_textBox.Name = "quiz1_textBox";
            this.quiz1_textBox.Size = new System.Drawing.Size(153, 27);
            this.quiz1_textBox.TabIndex = 12;
            // 
            // mid_textBox
            // 
            this.mid_textBox.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.mid_textBox.Location = new System.Drawing.Point(261, 120);
            this.mid_textBox.Name = "mid_textBox";
            this.mid_textBox.Size = new System.Drawing.Size(153, 27);
            this.mid_textBox.TabIndex = 13;
            // 
            // quiz4_textBox
            // 
            this.quiz4_textBox.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.quiz4_textBox.Location = new System.Drawing.Point(261, 301);
            this.quiz4_textBox.Name = "quiz4_textBox";
            this.quiz4_textBox.Size = new System.Drawing.Size(153, 27);
            this.quiz4_textBox.TabIndex = 14;
            // 
            // attendance_textBox
            // 
            this.attendance_textBox.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.attendance_textBox.Location = new System.Drawing.Point(261, 347);
            this.attendance_textBox.Name = "attendance_textBox";
            this.attendance_textBox.Size = new System.Drawing.Size(153, 27);
            this.attendance_textBox.TabIndex = 15;
            // 
            // Result_box
            // 
            this.Result_box.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Result_box.FormattingEnabled = true;
            this.Result_box.ItemHeight = 25;
            this.Result_box.Location = new System.Drawing.Point(457, 18);
            this.Result_box.Name = "Result_box";
            this.Result_box.Size = new System.Drawing.Size(826, 429);
            this.Result_box.TabIndex = 16;
            // 
            // Add_button
            // 
            this.Add_button.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.Add_button.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Add_button.Location = new System.Drawing.Point(112, 415);
            this.Add_button.Name = "Add_button";
            this.Add_button.Size = new System.Drawing.Size(75, 44);
            this.Add_button.TabIndex = 17;
            this.Add_button.Text = "Add";
            this.Add_button.UseVisualStyleBackColor = false;
            this.Add_button.Click += new System.EventHandler(this.Add_button_Click);
            // 
            // Submit_button
            // 
            this.Submit_button.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.Submit_button.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Submit_button.Location = new System.Drawing.Point(261, 415);
            this.Submit_button.Name = "Submit_button";
            this.Submit_button.Size = new System.Drawing.Size(100, 44);
            this.Submit_button.TabIndex = 18;
            this.Submit_button.Text = "Calculate";
            this.Submit_button.UseVisualStyleBackColor = false;
            this.Submit_button.Click += new System.EventHandler(this.Submit_button_Click);
            // 
            // cgpa_label
            // 
            this.cgpa_label.AutoSize = true;
            this.cgpa_label.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.cgpa_label.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cgpa_label.ForeColor = System.Drawing.SystemColors.Desktop;
            this.cgpa_label.Location = new System.Drawing.Point(452, 463);
            this.cgpa_label.Name = "cgpa_label";
            this.cgpa_label.Size = new System.Drawing.Size(69, 25);
            this.cgpa_label.TabIndex = 19;
            this.cgpa_label.Text = "CGPA";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1393, 497);
            this.Controls.Add(this.cgpa_label);
            this.Controls.Add(this.Submit_button);
            this.Controls.Add(this.Add_button);
            this.Controls.Add(this.Result_box);
            this.Controls.Add(this.attendance_textBox);
            this.Controls.Add(this.quiz4_textBox);
            this.Controls.Add(this.mid_textBox);
            this.Controls.Add(this.quiz1_textBox);
            this.Controls.Add(this.quiz2_textBox);
            this.Controls.Add(this.quiz3_textBox);
            this.Controls.Add(this.final_textBox);
            this.Controls.Add(this.course_comboBox);
            this.Controls.Add(this.Attendance_label);
            this.Controls.Add(this.Quiz3_label);
            this.Controls.Add(this.Quiz4_label);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.Quiz2_label);
            this.Controls.Add(this.Final_label);
            this.Controls.Add(this.Mid_label);
            this.Controls.Add(this.Course_label);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label Course_label;
        private System.Windows.Forms.Label Mid_label;
        private System.Windows.Forms.Label Final_label;
        private System.Windows.Forms.Label Quiz2_label;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label Quiz4_label;
        private System.Windows.Forms.Label Quiz3_label;
        private System.Windows.Forms.Label Attendance_label;
        private System.Windows.Forms.ComboBox course_comboBox;
        private System.Windows.Forms.TextBox final_textBox;
        private System.Windows.Forms.TextBox quiz3_textBox;
        private System.Windows.Forms.TextBox quiz2_textBox;
        private System.Windows.Forms.TextBox quiz1_textBox;
        private System.Windows.Forms.TextBox mid_textBox;
        private System.Windows.Forms.TextBox quiz4_textBox;
        private System.Windows.Forms.TextBox attendance_textBox;
        private System.Windows.Forms.ListBox Result_box;
        private System.Windows.Forms.Button Add_button;
        private System.Windows.Forms.Button Submit_button;
        private System.Windows.Forms.Label cgpa_label;
    }
}

