<?php
include_once(__DIR__ . '/../vendor/autoload.php');
date_default_timezone_set('Asia/Ho_Chi_Minh');
class DB
{
    private $connect;
    private $inTransaction = false;
    function connect()
    {
        if (!$this->connect) {
            if (!$this->connect) {
                $this->connect = mysqli_connect('localhost', username, password, database) or die('Error => DATABASE');
                mysqli_query($this->connect, "set names 'utf8mb4'");
            }
        }
    }
    public function begin_transaction()
    {
        $this->connect();
        $result = mysqli_begin_transaction($this->connect);
        if ($result) {
            $this->inTransaction = true;
        }
        return $result;
    }
    public function in_transaction()
    {
        return $this->inTransaction;
    }
    public function commit()
    {
        $this->connect();
        return mysqli_commit($this->connect);
    }

    public function rollback()
    {
        $this->connect();
        return mysqli_rollback($this->connect);
    }
    public function get_id_insert()
    {
        $this->connect();
        return mysqli_insert_id($this->connect);
    }
    public function dis_connect()
    {
        if ($this->connect) {
            mysqli_close($this->connect);
        }
    }
    public function query($sql)
    {
        $this->connect();
        $row = $this->connect->query($sql);
        return $row;
    }
    public function insert($table, $data)
    {
        $this->connect();
        $field_list = '';
        $value_list = '';
        foreach ($data as $key => $value) {
            $field_list .= ",$key";
            $value_list .= ",'" . mysqli_real_escape_string($this->connect, $value) . "'";
        }
        $sql = 'INSERT INTO ' . $table . '(' . trim($field_list, ',') . ') VALUES (' . trim($value_list, ',') . ')';

        return mysqli_query($this->connect, $sql);
    }
    public function update($table, $data, $where)
    {
        $this->connect();

        $sql = '';
        foreach ($data as $key => $value) {
            // Check if $value is null or not
            if ($value === null) {
                $escapedValue = 'NULL'; // Use NULL in SQL for null values
            } else {
                // Escape the value using mysqli_real_escape_string if it's not null
                $escapedValue = "'" . mysqli_real_escape_string($this->connect, $value) . "'";
            }
            $sql .= "$key = $escapedValue,";
        }

        // Build the UPDATE query
        $sql = 'UPDATE ' . $table . ' SET ' . rtrim($sql, ',') . ' WHERE ' . $where;

        // Execute the query
        return mysqli_query($this->connect, $sql);
    }

    public function update_value($table, $data, $where, $value1)
    {
        $this->connect();
        $sql = '';
        foreach ($data as $key => $value) {
            $sql .= "$key = '" . mysqli_real_escape_string($this->connect, $value) . "',";
        }
        $sql = 'UPDATE ' . $table . ' SET ' . trim($sql, ',') . ' WHERE ' . $where . ' LIMIT ' . $value1;
        return mysqli_query($this->connect, $sql);
    }
    function cong($table, $data, $sotien, $where)
    {
        $this->connect();
        $row = $this->connect->query("UPDATE `$table` SET `$data` = `$data` + '$sotien' WHERE $where ");
        return $row;
    }
    function tru($table, $data, $sotien, $where)
    {
        $this->connect();
        $row = $this->connect->query("UPDATE `$table` SET `$data` = `$data` - '$sotien' WHERE $where ");
        return $row;
    }
    public function site($data)
    {
        $this->connect();
        $row = $this->connect->query("SELECT * FROM `configs` WHERE `name` = '$data' ")->fetch_array();
        return $row['value'];
    }
     public function setting($data)
    {
        $this->connect();
        $row = $this->connect->query("SELECT * FROM `settings` WHERE `key` = '$data' ")->fetch_array();
        return $row['value'];
    }
    public function remove($table, $where)
    {
        $this->connect();
        $sql = "DELETE FROM $table WHERE $where";
        return mysqli_query($this->connect, $sql);
    }
    public function get_list($sql)
    {
        $this->connect();
        $result = mysqli_query($this->connect, $sql);
        if (!$result) {
            die('Câu truy vấn bị sai');
        }
        $return = array();
        while ($row = mysqli_fetch_assoc($result)) {
            $return[] = $row;
        }
        mysqli_free_result($result);
        return $return;
    }
    public function get_row($sql)
    {
        $this->connect();
        $result = mysqli_query($this->connect, $sql);
        if (!$result) {
            die('Câu truy vấn bị sai');
        }
        $row = mysqli_fetch_assoc($result);
        mysqli_free_result($result);
        if ($row) {
            return $row;
        }
        return false;
    }
    public function num_rows($sql)
    {
        $this->connect();
        $result = mysqli_query($this->connect, $sql);
        if (!$result) {
            die('Câu truy vấn bị sai');
        }
        $row = mysqli_num_rows($result);
        mysqli_free_result($result);
        if ($row) {
            return $row;
        }
        return false;
    }
}
