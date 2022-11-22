<?php 

defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends CI_Controller {

    
    public function __construct()
    {
        parent::__construct();
        is_logged_in();
        $this->load->model('auth_m');
    }
    
    public function index() 
    {
        $data['dashboard'] = true;
        $data['content'] = 'dashboard';
        $this->load->view('index',$data);
    }

    public function profil_saya(){
        $data['profil_saya'] = true;
        $data['profil'] = user(__session('iduser'));
        $data['content'] = 'profil';
        $this->load->view('index',$data);
    }



    public function profil_user(){
        $data['profil_user'] = true;
        $data['profil'] = user(__session('iduser'));
        $data['content'] = 'profil_user';
        $this->load->view('index',$data); 
    }

    public function form_isi(){
        $data['form_isi'] = true;
        $data['form_isi'] = user(__session('iduser'));
        $data['content'] = 'form_isi';
        $this->load->view('index',$data);
    }
    public function formulir(){
        $data = [
            'nik'=>$this->input->post('nik',true),
            'nama_lengkap'=>$this->input->post('nama_lengkap',true),
            'nip'=>$this->input->post('nip',true),
            'pangkat'=>$this->input->post('pangkat',true),
            'jabatan'=>$this->input->post('jabatan',true),
            'unitkerja'=>$this->input->post('unitkerja',true),
            'instansi'=>$this->input->post('instansi',true),
            'tempat_lahir'=>$this->input->post('tempat_lahir',true),
            'tanggal_lahir'=>$this->input->post('tanggal_lahir',true),
            'jenis_kelamin'=>$this->input->post('jenis_kelamin',true),
            'agama'=>$this->input->post('agama',true),
            'email'=>$this->input->post('email',true),
            'nomorhp'=>$this->input->post('nomorhp',true),
            'alamat'=>$this->input->post('alamat',true)
        ];
        $this->auth_m->formulir($data,$this->input->post('idprofil',true));
        $this->session->set_flashdata('success','data');
        redirect('pengajuan/create_ajuan');
    }

    public function update_profil(){
        $data = [
            'nik'=>$this->input->post('nik',true),
            'nama_lengkap'=>$this->input->post('nama_lengkap',true),
            'nip'=>$this->input->post('nip',true),
            'pangkat'=>$this->input->post('pangkat',true),
            'jabatan'=>$this->input->post('jabatan',true),
            'unitkerja'=>$this->input->post('unitkerja',true),
            'instansi'=>$this->input->post('instansi',true),
            'tempat_lahir'=>$this->input->post('tempat_lahir',true),
            'tanggal_lahir'=>$this->input->post('tanggal_lahir',true),
            'jenis_kelamin'=>$this->input->post('jenis_kelamin',true),
            'agama'=>$this->input->post('agama',true),
            'email'=>$this->input->post('email',true),
            'nomorhp'=>$this->input->post('nomorhp',true),
            'alamat'=>$this->input->post('alamat',true)
        ];
        $this->auth_m->updateProfil($data,$this->input->post('idprofil',true));
        $password = $this->input->post('password',true);
        if($password!=""){
            $data = [
                'password'=>password_hash($password,PASSWORD_DEFAULT)
            ];
            $this->auth_m->updatePass($data,$this->input->post('iduser',true));
        }
        $this->session->set_flashdata('success','Anda telah berhasil mengubah data profil');
        redirect('dashboard/profil_saya');
    }


    public function update_data(){
        $data = [
            'nik'=>$this->input->post('nik',true),
            'nama_lengkap'=>$this->input->post('nama_lengkap',true),
            'nip'=>$this->input->post('nip',true),
            'pangkat'=>$this->input->post('pangkat',true),
            'jabatan'=>$this->input->post('jabatan',true),
            'unitkerja'=>$this->input->post('unitkerja',true),
            'instansi'=>$this->input->post('instansi',true),
            'tempat_lahir'=>$this->input->post('tempat_lahir',true),
            'tanggal_lahir'=>$this->input->post('tanggal_lahir',true),
            'jenis_kelamin'=>$this->input->post('jenis_kelamin',true),
            'agama'=>$this->input->post('agama',true),
            'email'=>$this->input->post('email',true),
            'nomorhp'=>$this->input->post('nomorhp',true),
            'alamat'=>$this->input->post('alamat',true)
        ];
        $this->auth_m->updateProfil($data,$this->input->post('idprofil',true));
        $password = $this->input->post('password',true);
        if($password!=""){
            $data = [
                'password'=>password_hash($password,PASSWORD_DEFAULT)
            ];
            $this->auth_m->updatePass($data,$this->input->post('iduser',true));
        }
        $this->session->set_flashdata('success','Anda telah berhasil mengubah data profil');
        redirect('pengajuan/upload_file');
    }

}

/* End of file Dashboard.php */