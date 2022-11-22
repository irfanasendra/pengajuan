
<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Profil Saya</h1>
</div>

<div class="card p-2 shadow-sm border-bottom-primary">
    <div class="card-header bg-white">
        <h4 class="font-weight-bold text-dark text-center">
            <?=$profil['nama_lengkap'];?>
        </h4>
     </div>
          
    <div class="card-body">
                



<div class="card-body">
    <div class="row">

        <div class="card-body mb-4 justify-content-center pl-5">
            <div class="col-md-8">
                <table class="table">
                    <tr>
                        <th>NIK</th>
                        <td> <?=$profil['username'];?></td>
                    </tr>
                    <tr>
                        <th>NIP</th>
                        <td> <?=$profil['nip'];?></td>
                    </tr>
                    <tr>
                        <th>Pangkat / golongan</th>
                        <td> <?=$profil['pangkat'];?></td>
                    </tr>
                    <tr>
                        <th>Jabatan</th>
                        <td> <?=$profil['jabatan'];?></td>
                    </tr>
                    <tr>
                        <th>Unit Kerja</th>
                        <td> <?=$profil['unitkerja'];?></td>
                    </tr>
                    <tr>
                        <th>Email</th>
                        <td> <?=$profil['email'];?></td>
                    </tr>
                    <tr>
                        <th>No HP</th>
                        <td> <?=$profil['nomorhp'];?></td>
                    </tr>
                </table>
            </div>
            <a href="<?=base_url('dashboard/profil_saya');?>" class="btn btn-primary">Edit profile</a>
            

        </div>

    </div>
</div>
</div>